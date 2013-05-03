from fabric.api import local, cd, run, prefix, settings, abort
from fabric.contrib.console import confirm
import os


# setup that is not ubuntu version-dependent
def _prepare_base():
    local("apt-get install curl")
    local("apt-get install zsh")
    local("apt-get install build-essential")



# 10.04-specific setup
def prepare_dev_lucid():
    _prepare_base()
    local("apt-get install git-core")


# Setup for current ubuntu (may not work on older versions)
def prepare_dev():
    _prepare_base()
    local("apt-get install git")

