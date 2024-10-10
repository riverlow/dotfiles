# ENV {{{
set -gx TERM alacritty
set -gx EDITOR vim
set fish_greeting
set -gx LANG en_US.UTF-8

# fzf
set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

# bat
set -gx BAT_THEME gruvbox-dark

# wine
set -gx WINEPREFIX ~/WINE_Library
set -gx DXVK_HUD 1
# ENV }}}
# Aliases {{{
alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias la       "ls -a"
alias ll       "ls -l"
alias pas      "gopass"
alias yd       "yt-dlp"
alias ymp3     "yt-dlp -x --audio-format mp3"
alias au       "arc unarchive"
alias ff       "fastfetch"
alias fe       "fastfetch -c $HOME/.config/fastfetch/neofetch.jsonc"

alias bat      "bat --color=always"

# docker
alias dp       "docker compose"
alias di       "docker image"
alias dis      "docker images"
alias dc       "docker container"
alias dr       'docker run --detach-keys="ctrl-z,ctrl-q"'
alias dx       'docker container exec --detach-keys="ctrl-z,ctrl-q" -it'

# duf
alias ds       "duf --only local"

## python
alias py       "python3"
alias pye      "pyenv"
alias pie      "pipenv"

# rm - rip
alias rip      'rip --graveyard ~/.local/share/Trash'
# Aliases }}}
# PATH {{{

fish_add_path /usr/local/bin /usr/local/sbin

# local
fish_add_path $HOME/myscripts/bin/ $HOME/.local/bin

# go
fish_add_path $HOME/go/bin/ $HOME/.local/go/bin /usr/local/go/bin

# Rust 
fish_add_path $HOME/.cargo/bin
# PATH }}}
# ostype {{{
if test (uname) = "Linux";
    source ~/.config/fish/conf.d/linux.fish
else
    source ~/.config/fish/conf.d/macOS.fish
end
# ostype }}}
