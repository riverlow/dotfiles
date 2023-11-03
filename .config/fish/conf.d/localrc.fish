set -gx TERM xterm-256color
set -gx EDITOR vim
set fish_greeting

# alias
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias pas="gopass"
alias mux="tmuxinator"
alias dk=docker
alias yd=yt-dlp
alias py=python3
alias compose="docker compose"
alias bat="bat --color=always"

# lang
set -gx LANG en_US.UTF-8

# path
fish_add_path /usr/local/bin /usr/local/sbin

# local
fish_add_path $HOME/myscripts/bin/ $HOME/.local/bin

# go
fish_add_path $HOME/go/bin/ $HOME/.local/go/bin /usr/local/go/bin

# Rust 
fish_add_path $HOME/.cargo/bin

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin


# fzf
set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

source ~/.config/fish/conf.d/linux.fish
source ~/.config/fish/conf.d/macOS.fish
