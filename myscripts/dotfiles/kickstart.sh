#!/usr/bin/env bash
#
fontsdir=$HOME/myfonts

echo install vim-plug
pip3 install msgpack greenlet pynvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo install fonts
mkdir -p $fontsdir

# https://github.com/powerline/fonts
git clone https://github.com/powerline/fonts.git --depth=1 $fontsdir/powerlinefonts
cd $fontsdir/powerlinefonts/ && ./install.sh
