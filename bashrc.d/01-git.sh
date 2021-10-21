#!/usr/bin/bash

# Show the current git repo branch and state in bash (http://fedoraproject.org/wiki/Git_Quickref#Display_current_branch_in_bash)
source /usr/share/git-core/contrib/completion/git-prompt.sh 
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUPSTREAM="auto verbose"
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
#export PS1='[$? \u@\h \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ '
export PS1='\[\e]2;\u@\h:\w\a\]\[\]\D{%Y-%m-%d %H:%M:%S}\[\] \[\][\[\]\u@\h\[\]]\[\] \[\][\w]\[\]\n \[`rt=$?; if [ $rt -ne 0 ]; then echo \]🤮\[\]$rt\[; fi`\] ▸'

export PATH="$PATH:/usr/share/doc/git-1.8.2.1/contrib/remote-helpers/"

function slowgit() {
	export PS1="[\u@\h \W]\$ "
}
