#! /bin/sh
# Core commands for bringing up a vm to a known-good state
# Should be idempotent


curl -L https://github.com/gmoothart.keys > ~/.ssh/authorized_keys2

#
# Default packages and sources
apt-get update -y
apt-get install openssh-server ctags mercurial ack-grep curl zsh \
  git build-essential x11-xkb-utils openssl libreadline6 libreadline6-dev \
  zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev \
  libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion \
  pkg-config python-dev \
  msttcorefonts fonts-inconsolata ttf-droid ttf-ubuntu-font-family -y

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
./install.sh

#
# vim from source
apt-get build-dep vim -y
hg clone https://vim.googlecode.com/hg/ vim-src
cd vim-src
./configure --with-features=huge
make
make install

#
# misc
mv /usr/bin/ack-grep /usr/bin/ack

echo "####### Done! #############" 



############## vm
#apt-get install midori
#
#
#
#@// set up mysql for remote access@
#@vim /etc/mysql/my.cnf@
#@bind-address = 0.0.0.0@
#
#mysql -uroot mysql -e "grant all on *.* to root@'192.168.%.%'"
#/etc/init.d/mysql restart
#
#
#
############### native install
#apt-get install chromium
#
