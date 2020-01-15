#!/bin/bash

# First step
#git clone --bare https://github.com/iofxl/dotfiles.git $HOME/.dotfiles

function dotfiles {
        $(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
cd $HOME
mkdir -p .dotfiles-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
        dotfiles checkout 2>&1 | awk '/^\s+/ { print $1}' | xargs -I{} rsync -avR --remove-source-files {} .dotfiles-backup
fi;
dotfiles checkout
dotfiles config status.showUntrackedFiles no

