#!/usr/bin/env bash
#
# it's archlinux
if  command -v pacman; then

    # update system
    pacman -Sy archlinux-keyring && pacman -Syyu

    # terminal
    pacman -Sy alacritty tmux tmuxp 

    # zsh
    pacman -Sy zsh 

    # utilities
    pacman -Sy openssh git vim bc gnupg rsync unzip usbutils tree jq dnsutils

    # riir & built in golang
    pacman -S ripgrep fd dog eza bat vivid

    # build in golang
    pacman -S fzf

    # multimedia tools
    pacman -Sy ffmpeg mp3wrap mp3splt mediainfo imagemagick 

    # devel
    pacman -Sy base-devel linux-headers go rust nodejs 

    # networks wifi wireguard
    pacman -Sy iw iwd wireguard-tools systemd-resolvconf

    # system management
    pacman -Sy lsof tcpdump iperf3
    # fonts
    pacman -Sy otf-font-awesome noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra 

fi

if [[ `uname` == "Linux" && grep -q "Ubuntu" /etc/issue ]]; then
    apt update
    apt -y upgrade
fi

sh install_ctags.sh
