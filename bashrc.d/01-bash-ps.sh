#!/usr/bin/bash

# Show the current git repo branch and state in bash (http://fedoraproject.org/wiki/Git_Quickref#Display_current_branch_in_bash)
source /usr/share/git-core/contrib/completion/git-prompt.sh 
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUPSTREAM="auto verbose"
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
#export PS1='[$? \u@\h \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ '

export ALWAYS_PRINT_SELINUX=false

function _ps1_selinux() {
	function _print_if_not_default() {
		field=$1
		curval=$2
		normval=$3
		printsep=$4

		if [ "$curval" != "$normval" -o "$ALWAYS_PRINT_SELINUX" == "true" ];
		then
			if [ $printsep == 1 ];
			then
				echo -n ":"
			fi
			if [ "$curval" != "$normval" ];
			then
				_warn_n "$curval"
			else
				echo -n "$curval"
			fi
			return 1
		else
			return 0
		fi
	}

	function _merge_range() {
		selevel=$1
		secats=$2

		if [ "$secats" == "" ];
		then
			echo -n $selevel
		else
			echo -n "$selevel:$secats"
		fi
	}

	#IFS=':' read -a cts </proc/thread-self/attr/current
	cts=$(id -Z)
	cts=(${cts//:/ })

	serange=$(_merge_range "${cts[3]}" "${cts[4]}")

	_print_if_not_default "user" "${cts[0]}" "sysadm_u" 0
	_print_if_not_default "role" "${cts[1]}" "sysadm_r" $?
	_print_if_not_default "type" "${cts[2]}" "sysadm_t" $?
	_print_if_not_default "range" "$serange" "s0-s0:c0.c1023" $?
}

export PS1='\[\e]2;\u@\h:\w\a\]\[\]\D{%Y-%m-%d %H:%M:%S}\[\] \[\][\[\]\u@\h\[\]]\[\] \[\][\w]\[\] (`_ps1_selinux`)\n \[`rt=$?; if [ $rt -ne 0 ]; then echo \]🤮\[\]$rt\[; fi`\] ▸ '
export PS1='\[\e]2;\u@\h:\w\a\]\[\]\D{%Y-%m-%d %H:%M:%S}\[\] \[\][\[\]\u@\h\[\]]\[\] \[\][\w]\[\] (`rt=$?; _ps1_selinux; printf ")\n\["; if [ $rt -ne 0 ]; then echo \]🤮\[\]$rt\[; fi`\] ▸ '

export PATH="$PATH:/usr/share/doc/git-1.8.2.1/contrib/remote-helpers/"

function slowgit() {
	export PS1="[\u@\h \W]\$ "
}
