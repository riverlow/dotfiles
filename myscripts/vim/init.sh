#!/bin/bash

pip3 install --user --upgrade msgpack greenlet pynvim

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

