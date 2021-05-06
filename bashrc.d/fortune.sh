#!/usr/bin/sh
if [ -f /usr/bin/fortune ];
then
    fortune -s >&2
fi
