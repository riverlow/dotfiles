#!/usr/bin/zsh

DEST=${HOME}/offline/
mkdir -p $DEST

# zplugin
mkdir -p ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
zcompile ~/.zplugin/bin/zplugin.zsh

# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# cause option '-R', must let pwd to be $HOME
cd $HOME
rsync -avR .zplugin $DEST
rsync -avR .tmux/plugins $DEST
rsync -avR .local/share/nvim/site/autoload/plug.vim $DEST
rsync -avR .local/lib $DEST
rsync -avR .vim/plugged $DEST
rsync -avR .fzf $DEST
rsync -avR go $DEST
