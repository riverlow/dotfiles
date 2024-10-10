# ENVs {{{
# homebrew
export HOMEBREW_FORCE_BREWED_CURL=1
# ENVs }}}
# PATH {{{
path=(/usr/local/opt/curl/bin /usr/local/opt/gawk/libexec/gnubin /usr/local/opt/iftop/sbin /usr/local/opt/unzip/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin /usr/local/opt/gnu-tar/libexec/gnubin /usr/local/opt/gnu-indent/libexec/gnubin /usr/local/opt/grep/libexec/gnubin /usr/local/opt/make/libexec/gnubin/ /usr/local/opt/libpcap/bin $path)

path=(/usr/local/opt/openjdk/bin $path)

# c++
path=(/usr/local/opt/gettext/bin $path)

# openssl
path=(/usr/local/opt/openssl@3/bin $path)

# llvm
path=(/usr/local/opt/llvm/bin $path)

# bison
path=(/usr/local/Cellar/bison/3.8.2/bin/ $path)

# qt5
path=(/usr/local/opt/qt@5/bin $path)

# bin_macos
path=($HOME/myscripts/bin_macos $path)

export PATH
# PATH }}}
# zsh-syntax-highlighting {{{
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
# source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh-syntax-highlighting }}}
# fsh {{{
# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/plugins/fast-syntax-highlighting
source $ZSH_PLUGINS/fsh/fast-syntax-highlighting.plugin.zsh
# fsh }}}
# zsh-autosuggestions {{{
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh-autosuggestions }}}
# zsh-completions {{{
# FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
# this shit slow zsh startup a lot. 
# from:
#first_prompt_lag_ms=73.841
# first_command_lag_ms=74.116
# to:
# first_prompt_lag_ms=200.004
# first_command_lag_ms=200.370
# zsh-completions }}}
# pyenv {{{
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - --no-rehash)"
# pyenv }}}
