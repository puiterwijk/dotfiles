#!/bin/bash
if command -v thefuck &> /dev/null
then
	eval $(thefuck --alias)
	alias f=fuck
fi
