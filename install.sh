#! /bin/sh
find ~/.dotfiles/ -maxdepth 1 -type f -name ".*" -exec ln -s -f {} --target-directory=$HOME \;
ln -s -f ~/.dotfiles/.vim ~/.dotfiles/.emacs.d $HOME
