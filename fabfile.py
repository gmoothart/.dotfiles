from fabric.api import local, lcd, prefix, settings, abort
from fabric.contrib.console import confirm
import os


# setup that is not ubuntu version-dependent
def _prepare_base():
    local("sudo apt-get install curl")
    local("sudo apt-get install zsh")
    local("sudo apt-get install build-essential")

    with lcd('~'):
        local("git clone git@github.com:gmoothart/.dotfiles")
        local(".dotfiles/install.sh")



# 10.04-specific setup
def prepare_dev_lucid():
    _prepare_base()
    local("sudo apt-get install git-core")


# Setup for current ubuntu (may not work on older versions)
def prepare_dev():
    _prepare_base()
    local("sudo apt-get install git")

