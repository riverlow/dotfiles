#!/bin/bash
# must use --user, or it will warn PermissionError
# the destination dir is .local/
pip3 install --user --upgrade msgpack greenlet pynvim

# install nvim
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/
sudo ln -sf /usr/local/bin/{nvim.appimage,nvim}

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


