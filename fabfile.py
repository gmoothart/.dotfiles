from fabric.api import local, lcd, prefix, settings, abort
from fabric.contrib.console import confirm
from os import path


# TODO:
# latest git from PPA
# vim/gvim from source


# setup that is not ubuntu version-dependent
def _prepare_base():
    # adding PPAs
    local("sudo apt-get install python-software-properties --yes")  # in case add-apt-repository is not installed
    local("sudo add-apt-repository ppa:git-core/ppa")  # recent git
    local("sudo apt-get update")

    local("sudo apt-get install curl --yes")
    local("sudo apt-get install zsh --yes")
    local("sudo apt-get install build-essential --yes")
    local("sudo apt-get install git --yes")

    # dotfiles
    with lcd('~'):
        if path.exists(path.expanduser('~/.dotfiles')):
            with lcd('.dotfiles'):
                local("git pull")
        else:
            local("git clone git@github.com:gmoothart/.dotfiles")

        local(".dotfiles/install.sh")

    # key forwarding
    local("curl -L https://github.com/gmoothart.keys > ~/.ssh/authorized_keys2")

    # Oh-my-zsh. Must ignore error and change shell manually on ubuntu
    with settings(warn_only=True):
        local("curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh")
    local("chsh $USER -s $(which zsh);")

    # for x11-forwarding
    _gui_setup()


def _gui_setup():
    #perty fonts
    local("sudo apt-get install fonts-inconsolata --yes")
    local("sudo apt-get install ttf-droid")
    local("sudo apt-get install ttf-ubuntu-font-family --yes")

    local("sudo apt-get install gnome-terminal --yes --yes")


# 10.04-specific setup
def prepare_dev_lucid():
    _prepare_base()


# Setup for current ubuntu (may not work on older versions)
def prepare_dev():
    _prepare_base()
