#
#Setup an ubuntu machine as a dev box, accessible with ssh and x-forwarding
#
require_recipe "base"

# midori, for local browsing
# mysql, if included, set up for remote access
#

# for key-forwarding
openssh-server 
curl -L https://github.com/gmoothart.keys > ~/.ssh/authorized_keys2
