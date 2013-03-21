#configuration needed for both terminal and gui setup
#
require_recipe "fonts"
require_recipe "dotfiles"

# python, with pip/virtualenv/dev
# ruby, with dev
# cassandra
# mysql
# sun java
# oh-my-zsh
#

package("curl")
package("git")
package("zsh")
package("build-essential")
  
# why do I need these???
  automake bison subversion \
  pkg-config 
  
  python-dev \


#
## Vim from source
ctags mercurial ack-grep
apt-get build-dep vim -y
hg clone https://vim.googlecode.com/hg/ vim-src
cd vim-src
./configure --with-features=huge
make
make install

mv /usr/bin/ack-grep /usr/bin/ack
