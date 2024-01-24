set -gx TERM alacritty
set -gx EDITOR vim
set fish_greeting

# alias
alias so       "source"
alias bat      "bat --color=always"
alias dp       "docker compose"
alias di       "docker image"
alias dis      "docker images"
alias dc       "docker container"
alias dr       'docker run --detach-keys="ctrl-z,ctrl-q"'
alias dx       'docker container exec --detach-keys="ctrl-z,ctrl-q" -it'
alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls       "eza -s type"
alias la       "ls -a"
alias ll       "ls -l"
alias mux      "tmuxinator"
alias pas      "gopass"
alias yd       "yt-dlp"
alias ymp3     "yt-dlp -x --audio-format mp3"
alias au       "arc unarchive"

## python
alias py "python3"
alias pye "pyenv"
alias pie "pipenv"

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

# fzf
set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

# bat
set -gx BAT_THEME gruvbox-dark

# wine
set -gx WINEPREFIX ~/WINE_Library
set -gx DXVK_HUD 1

source ~/.config/fish/conf.d/linux.fish
source ~/.config/fish/conf.d/macOS.fish




