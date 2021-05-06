#!/usr/bin/bash
if [ ! -f /bin/vim ];
then
	alias vim=vi
fi

function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
function mkcd () { mkdircd $@; }

alias dd="dd status=progress"

alias excuse="fortune /usr/share/games/fortune/bofh-excuses"

if [ -f /usr/bin/dnf ];
then
    alias yum="dnf"
fi
