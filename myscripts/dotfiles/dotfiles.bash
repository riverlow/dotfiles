#!/bin/bash

function dotfiles {
   $(which git) --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME} $@
}

# dotfiles commit -m a
# dotfiles push
