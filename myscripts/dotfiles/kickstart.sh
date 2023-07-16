#!/usr/bin/bash
#

# vim
pipx install msgpack greenlet pynvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
