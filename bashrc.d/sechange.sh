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

	options=("Personal" "Work")
	PS3="Choose an selinux mode: "
	select opt in "${options[@]}"
	do
		case $opt in
			"Personal")
				echo "Personal selected"
				SEMODE="personal"
				newrole -l s0:c1-s0:c1
				break
				;;
			"Work")
				echo "Work selected"
				SEMODE="work"
				newrole -l s0:c2-s0:c2
				break
				;;
			*)
				echo "Invalid choice"
		esac
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
