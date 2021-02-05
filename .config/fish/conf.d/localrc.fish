set -U fish_user_paths $HOME/nvim-osx64/bin/ $HOME/.cargo/bin $HOME/myscripts/bin/ $HOME/go/bin/ /usr/local/go/bin /usr/local/opt/unzip/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin /usr/local/opt/gnu-tar/libexec/gnubin /usr/local/opt/gnu-indent/libexec/gnubin /usr/local/opt/grep/libexec/gnubin /usr/local/opt/openssl/bin 

set TERM xterm-256color
set fish_greeting

# set -x GDK_SCALE 1
# set -x QT_AUTO_SCREEN_SCALE_FACTOR 1



# alias
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="ls --color=auto"

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
