#!/usr/bin/bash

# Show the current git repo branch and state in bash (http://fedoraproject.org/wiki/Git_Quickref#Display_current_branch_in_bash)
source /usr/share/git-core/contrib/completion/git-prompt.sh 
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUPSTREAM="auto verbose"
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
#export PS1='[\u@\h \W$(~/Config/scripts/did_dmach_touch_this)$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ '
export PS1='[$? \u@\h \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ '

export PATH="$PATH:/usr/share/doc/git-1.8.2.1/contrib/remote-helpers/"

function slowgit() {
	export PS1="[\u@\h \W]\$ "
}
