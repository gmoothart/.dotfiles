#! /bin/sh
# Core commands for bringing up a vm to a known-good state
# Should be idempotent

#
# choose colemak
sudo dpkg-reconfigure keyboard-configuration

#
# Creating user / ssh setup
sudo adduser gabe
sudo adduser gabe admin
su gabe
ssh-keygen -t rsa -C "gmoothart@gmail.com" -q
curl -L https://github.com/gmoothart.keys > ~/.ssh/authorized_keys2


#
# Default packages and sources
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install openssh-server ctags mercurial ack-grep curl zsh \
  git build-essential x11-xkb-utils openssl libreadline6 libreadline6-dev \
  zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev \
  libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion \
  pkg-config python-dev \
  # fonts
  msttcorefonts fonts-inconsolata ttf-droid ttf-ubuntu-font-family

#
#oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
chsh -s /bin/zsh gabe #might be needed if oh-my-zsh install fails

#
# install RVM
curl -L https://get.rvm.io | bash -s stable --ruby

#
# dotfiles
git clone git@github.com:gmoothart/.dotfiles ~/.dotfiles
sudo ./install.sh

#
# vim from source
sudo apt-get build-dep vim
hg clone https://vim.googlecode.com/hg/ vim-src
cd vim-src
./configure --with-features=huge
make
sudo make install

#
# misc
sudo mv /usr/bin/ack-grep /usr/bin/ack

echo "####### Done! #############" 



############## vm
#sudo apt-get install midori
#
#
#
#@// set up mysql for remote access@
#@sudo vim /etc/mysql/my.cnf@
#@bind-address = 0.0.0.0@
#
#mysql -uroot mysql -e "grant all on *.* to root@'192.168.%.%'"
#sudo /etc/init.d/mysql restart
#
#
#
############### native install
#sudo apt-get install chromium
#
