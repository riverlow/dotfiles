# Common {{{

# Common }}}
# setopts {{{
unsetopt beep
setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
setopt interactive_comments
setopt auto_continue
# setopts }}}
# bindkey {{{
bindkey -e
# bindkey }}}
# ENVs {{{
export ZSH_PLUGINS=$HOME/.zsh/plugins/
export EDITOR=vim
export VISUAL=vim
export TERM=alacritty
export LANG=en_US.UTF-8


# bat
export BAT_THEME=gruvbox-dark

# wine
export WINEPREFIX=$HOME/WINE_Library
export DXVK_HUD=1
# ENVs }}}
# History {{{
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000    # Maximum events for internal history
export SAVEHIST=10000    # Maximum events in history file
setopt HIST_SAVE_NO_DUPS # Do not write a duplicate event to the history file.
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
# History }}}
# PATH {{{
path=(/usr/local/bin /usr/local/sbin $path)

# local
path=($HOME/myscripts/bin/ $HOME/.local/bin $path)

# go
path=($HOME/go/bin/ $HOME/.local/go/bin /usr/local/go/bin $path)

# Rust 
path=($HOME/.cargo/bin $path)

export PATH
# PATH }}}
# Aliases {{{
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias ls='ls --color=always'
alias la="ls -a"
alias ll="ls -l"
alias pas="gopass"
alias yd="yt-dlp"
alias ymp3="yt-dlp -x --audio-format mp3"
alias au="arc unarchive"
alias ff="fastfetch"
alias fe="fastfetch -c $HOME/.config/fastfetch/neofetch.jsonc"

alias bat="bat --color=always"

# docker
alias dp="docker compose"
alias di="docker image"
alias dis="docker images"
alias dc="docker container"
alias dr='docker run --detach-keys="ctrl-z,ctrl-q"'
alias dx='docker container exec --detach-keys="ctrl-z,ctrl-q" -it'

# duf
alias ds="duf --only local"

## python
alias py="python3"
alias pye="pyenv"
alias pie="pipenv"

# rm - rip
alias rip='rip --graveyard ~/.local/share/Trash'

# Aliases }}}
# Prompt {{{
# Prompt }}}
# fzf {{{
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
source <(fzf --zsh)
# fzf }}}
# zsh-z {{{
# zsh-z 
# https://github.com/agkozak/zsh-z?tab=readme-ov-file#installation
source $ZSH_PLUGINS/zsh-z/zsh-z.plugin.zsh
# zsh-z }}}
# fsh {{{
# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/plugins/fast-syntax-highlighting
source $ZSH_PLUGINS/fsh/fast-syntax-highlighting.plugin.zsh
# fsh }}}
# Completion {{{
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _extensions _match _approximate _expand_alias _ignored _files
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' case-insensitive yes
zstyle ':completion:*:*:cp:*' file-sort modification
zstyle ':completion:*:cd:*' ignore-parents parent pwd
# zstyle ':completion:*' list-prompt '%S%M%u'  # Display matches in a friendly format
zstyle ':completion:*:warnings' format $'\e[91m -- No Matches Found --\e[0m'
zstyle ':completion:*:descriptions' format $'\e[2m -- %d --\e[0m'
zstyle ':completion:*:corrections' format $'\e[93m -- %d (errors: %e) --\e[0m'
# zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
zstyle ':completion:*' squeeze-slashes true

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.local/share/zsh/cache
zstyle ':completion:*' rehash true
setopt nohashall
autoload -Uz compinit; compinit 
# Completion }}}
# ostype {{{
if [[ `uname` == "Linux" ]]; then
    . $HOME/.config/zsh/linux.zsh
else
    . $HOME/.config/zsh/macOS.zsh
fi
# ostype }}}
