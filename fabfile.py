from fabric.api import local, cd, run, prefix, settings, abort
from fabric.contrib.console import confirm
import os


def prepare_dev():
    local("apt-get install curl")
    local("apt-get install git")
    local("apt-get install zsh")
    local("apt-get install build-essential")
