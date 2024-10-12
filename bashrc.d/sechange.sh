FORCE_SECHANGE=true

function _check_sechanged() {
	IFS=':' read -a cts </proc/thread-self/attr/current

	if [ "${cts[3]}" == "s0" ];
	then
		return 0
	else
		return 1
	fi
}

function _sechange() {
	_check_sechanged
	if [ $? == 0 ];
	then
		if [ "$1" != "auto" ];
		then
			_warn "Mode already selected! Please exit terminal to reselect"
		fi
		return 0
	fi

	options=("Personal" "Work" "Add security")
	PS3="Choose an selinux mode: "
	ADDED_CATS=""
	select opt in "${options[@]}"
	do
		CAT=""
		case $opt in
			"Personal")
				echo "Personal selected"
				CAT="c1"
				;;
			"Work")
				echo "Work selected"
				CAT="c2"
				;;
			"Add security")
				echo "Adding security bit"
				ADDED_CATS=",c3"
				;;
			*)
				echo "Invalid choice"
		esac

		if [ "$CAT" != "" ];
		then
			CATS="$CAT$ADDED_CATS"
			newrole -l s0:$CATS-s0:$CATS
			break
		fi
	done
	exit
}

if [ "$FORCE_SECHANGE" == "true" ];
then
	_sechange auto
else
	alias sechange=_sechange
	_check_sechanged
	if [ $? == 1 ];
	then
		_warn "NOTE: No selinux mode selected! Please run sechange!"
	fi
fi
