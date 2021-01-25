set -U fish_user_paths $HOME/.local/nvim-osx64/bin/ $HOME/.cargo/bin $HOME/myscripts/bin/ $HOME/go/bin/ /usr/local/go/bin /usr/local/opt/unzip/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin /usr/local/opt/gnu-tar/libexec/gnubin /usr/local/opt/gnu-indent/libexec/gnubin /usr/local/opt/grep/libexec/gnubin /usr/local/opt/openssl/bin 

set TERM xterm-256color
set fish_greeting

# set -x GDK_SCALE 1
# set -x QT_AUTO_SCREEN_SCALE_FACTOR 1



# alias
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="ls --color=auto"
alias fkf='flatpak run --filesystem=~/.local/share/fonts --filesystem=~/.config/fontconfig'

