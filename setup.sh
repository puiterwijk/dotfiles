#!/usr/bin/env -S bash -xe
# No insecure connections please
#sudo firewall-cmd --permanent --direct --add-rule ipv6 filter OUTPUT 0 -p tcp --dport 80 -j REJECT
#sudo firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 0 -p tcp --dport 80 -j REJECT
#sudo firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 0 -p tcp --dport 53 -j REJECT
#sudo firewall-cmd --permanent --direct --add-rule ipv6 filter OUTPUT 0 -p tcp --dport 53 -j REJECT
#sudo firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 0 -p udp --dport 53 -j REJECT
#sudo firewall-cmd --permanent --direct --add-rule ipv6 filter OUTPUT 0 -p udp --dport 53 -j REJECT

DF="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

rm -f ~/.rpmmacros ~/.gitconfig ~/.bashrc.d ~/.ssh/config

mkdir -p ~/.ssh

ln -rs $DF/rpmmacros ~/.rpmmacros
ln -rs $DF/git ~/.gitconfig
ln -rs $DF/bashrc.d ~/.bashrc.d
ln -rs $DF/ssh ~/.ssh/config
ln -rs $DF/tmux.conf ~/.tmux.conf

chmod -R 0600 ~/.ssh/*
chmod 0700 ~/.ssh
