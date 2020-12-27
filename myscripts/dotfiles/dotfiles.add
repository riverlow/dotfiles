#!/bin/bash

function dotfiles {
   $(which git) --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME} $@
}

dotfiles add $HOME/README.md
dotfiles add $HOME/.gitignore

dotfiles add $HOME/myscripts/

dotfiles add $HOME/.zshrc

dotfiles add $HOME/.tmux.conf
dotfiles add $HOME/.screenrc
dotfiles add $HOME/.poliporc


dotfiles add $HOME/.config/nvim/init.vim
dotfiles add $HOME/.config/nvim/UltiSnips/
dotfiles add $HOME/.config/mpv/mpv.conf
dotfiles add $HOME/.config/youtube-dl/config
dotfiles add $HOME/.config/tmuxinator/
dotfiles add $HOME/.config/fontconfig/fonts.conf


dotfiles add $HOME/pkgs/0get.sh
dotfiles add $HOME/pkgs/1privget.sh
dotfiles add $HOME/pkgs/2gitget.sh
dotfiles add $HOME/pkgs/main.go

dotfiles status

