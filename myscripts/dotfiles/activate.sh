#!/usr/bin/env bash
#
# install packages
if [ ! -f activated.txt ]; then
sh install_packages.sh

latestvim=$(echo `vim --version | head -1 | grep -E -o '[8-9]\.[0-9]+'` '>= 9' | bc -l)
if ! type vim || [ $latestvim -eq 0 ]; then
    echo need latest vim
    exit 1;
fi

if ! type pip3 ; then
    echo need pip3 
    exit 2;
fi

echo install vim-plug
pip3 install debugpy python-lsp-server
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo install vim plugins
vim -es -u ~/.vimrc -i NONE -c "PlugInstall | qa"

date > activated.txt

if [[ `uname` == 'Linux' ]]; then
    ./rsync_dotfiles_linux.sh
fi
