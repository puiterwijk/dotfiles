#!/usr/bin/bash
alias deploy='ansible-playbook ~/system-configs/playbooks/$(hostname --short).yml'
