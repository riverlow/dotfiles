#!/usr/bin/env bash
#
if [[ `uname` == "Linux" && grep -q "Ubuntu" /etc/issue ]]; then
    apt update
    apt -y upgrade
    apt install -y fish tree lsof git fzf python3-pip
    apt install -y pkg-config

    # golang
    if [[ `uname -i` == 'x86_64' ]]; then
	wget https://go.dev/dl/go1.21.6.linux-amd64.tar.gz
	rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.6.linux-amd64.tar.gz
    fi

    # rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env
    cargo install bat eza du-dust fd-find ripgrep 

    # uctags
    sh install_ctags.sh

fi
