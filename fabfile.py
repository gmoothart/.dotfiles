from fabric.api import local, lcd, prefix, settings, abort
from fabric.contrib.console import confirm
from os import path


# TODO:
# latest git from PPA
# vim/gvim from source


# setup that is not ubuntu version-dependent
def _prepare_base():
    local("sudo apt-get install curl")
    local("sudo apt-get install zsh")
    local("sudo apt-get install build-essential")

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

    local("curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh")

    # for x11-forwarding
    _gui_setup()


def _gui_setup():
    #perty fonts
    local("sudo fonts-inconsolata")
    local("sudo ttf-droid")
    local("sudo ttf-ubuntu-font-family")

    local("sudo apt-get install gnome-terminal")


# 10.04-specific setup
def prepare_dev_lucid():
    _prepare_base()
    local("sudo apt-get install git-core")


# Setup for current ubuntu (may not work on older versions)
def prepare_dev():
    _prepare_base()
    local("sudo apt-get install git")
