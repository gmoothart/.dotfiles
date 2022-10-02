#! /bin/sh
find ~/.dotfiles/ -maxdepth 1 -type f -name ".*" -exec ln -s -f {} $HOME \;
ln -s -f ~/.dotfiles/.vim ~/.dotfiles/.emacs.d $HOME
ln -s -f ~/.dotfiles/docker-compose.yml $HOME
