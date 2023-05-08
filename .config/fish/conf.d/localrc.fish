set -U fish_user_paths  /usr/local/bin /usr/local/sbin /usr/local/opt/iftop/sbin /usr/local/opt/unzip/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin /usr/local/opt/gnu-tar/libexec/gnubin /usr/local/opt/gnu-indent/libexec/gnubin /usr/local/opt/grep/libexec/gnubin 
set -gx TERM xterm-256color
set fish_greeting

# set -x GDK_SCALE 1
# set -x QT_AUTO_SCREEN_SCALE_FACTOR 1


# alias
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="ls --color=auto"
alias pas="gopass"
alias mux="tmuxinator"

# sway
set -x WLR_NO_HARDWARE_CURSORS 1

# ensure GUI frameworks use Wayland
# breaks a few apps or behaviors (Signal, Chromium, VSCodium, Emacs…)
set -x GDK_BACKEND wayland
set -x CLUTTER_BACKEND wayland
set -x QT_QPA_PLATFORM wayland-egl
# breaks a few apps or behaviors (Unity…)
#export SDL_VIDEODRIVER=wayland
set -x ELM_DISPLAY wl

# enable Wayland on Mozilla apps
set -x MOZ_ENABLE_WAYLAND 1
set -x MOZ_WEBRENDER 1

# fcitx
set -x  GTK_IM_MODULE fcitx
set -x  QT_IM_MODULE fcitx
set -x  XMODIFIERS @im=fcitx

# local
fish_add_path $HOME/myscripts/bin/ 

# go
fish_add_path $HOME/go/bin/ /usr/local/go/bin

# Rust 
fish_add_path $HOME/.cargo/bin

# python
fish_add_path $HOME/Library/Python/3.11/bin

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv

# Java
fish_add_path '/usr/local/opt/openjdk/bin' 
# For compilers to find openjdk you may need to set:
set -gx CPPFLAGS "-I/usr/local/opt/openjdk/include"
# If you need to have openjdk first in your PATH, run:


# android
fish_add_path "$HOME/.local/platform-tools/"

# c++
fish_add_path  "/usr/local/opt/gettext/bin"
set -gx LDFLAGS "-L/usr/local/opt/gettext/lib"
set -gx CPPFLAGS "-I/usr/local/opt/gettext/include"

# openssl
fish_add_path '/usr/local/opt/openssl@3/bin'
set -gx CPPFLAGS "-I/usr/local/opt/openssl@3/include"

set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@3/lib/pkgconfig"

# llvm
fish_add_path /usr/local/opt/llvm/bin
# To use the bundled libc++ please add the following LDFLAGS:
# LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"

# tizen
fish_add_path "~/tizen-studio/tools/ide/bin" 

# curl
fish_add_path /usr/local/opt/curl/bin

set -gx CPPFLAGS "-I/usr/local/opt/curl/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/curl/lib/pkgconfig"

# libgstreamer
set -gx LDFLAGS ""
set -gx CPPFLAGS "-I/usr/local/Cellar/gstreamer/1.20.1/include -I/usr/local/Cellar/gst-plugins-base//1.20.1/lib/include"

# qt5
fish_add_path /usr/local/opt/qt@5/bin

set -gx LDFLAGS "-L/usr/local/opt/qt@5/lib"
set -gx CPPFLAGS "-I/usr/local/opt/qt@5/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/qt@5/lib/pkgconfig"

# fzf
set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
