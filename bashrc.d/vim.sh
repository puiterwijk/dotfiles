#!/bin/bash
set -o vi
export EDITOR=vim

if ! command -v vim &> /dev/null
then
    alias vim=vi
fi
