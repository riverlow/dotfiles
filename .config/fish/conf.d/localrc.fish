set -U fish_user_paths $HOME/nvim-osx64/bin/ $HOME/.cargo/bin $HOME/myscripts/bin/ $HOME/go/bin/ /usr/local/go/bin /usr/local/opt/unzip/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin /usr/local/opt/gnu-tar/libexec/gnubin /usr/local/opt/gnu-indent/libexec/gnubin /usr/local/opt/grep/libexec/gnubin /usr/local/opt/openssl/bin 

set TERM xterm-256color
set fish_greeting

alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="ls --color=auto"

