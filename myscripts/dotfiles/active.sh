#!/usr/bin/env bash
#
fontsdir=$HOME/myfonts

if ! type pip3 || ! type vim || ! [[ vim --version | head -1 | grep -E -o '[8-9]\.[0-9]+' > 8 ]]; then
    echo need pip3 and latest vim
    exit 1;
fi

echo install vim-plug
pip3 install debugpy python-lsp-server
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo install vim plugins
vim -es -u ~/.vimrc -i NONE -c "PlugInstall | qa"

# echo install fonts
# mkdir -p $fontsdir
# https://github.com/powerline/fonts
# git clone https://github.com/powerline/fonts.git --depth=1 $fontsdir/powerlinefonts
# cd $fontsdir/powerlinefonts/ && ./install.sh
