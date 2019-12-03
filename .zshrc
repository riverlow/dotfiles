### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

setopt promptsubst

zplugin load zsh-users/zsh-autosuggestions
zplugin load zsh-users/zsh-syntax-highlighting
zplugin load zsh-users/zsh-history-substring-search


# ============================== Setting ==============================
bindkey -e
export TERM=xterm-256color
export EDITOR=vim

typeset -U path
path=(~/nvim-osx64/bin/ ~/.local/bin ~/.cargo/bin ~/myscripts/bin/ ~/go/bin/ /usr/local/go/bin /usr/local/opt/openssl/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin $path[@])
fpath=(/usr/local/share/zsh-completions $fpath)

if test "$(uname)" = "Darwin" ; then
	eval "$(gdircolors -b)"
else
	eval "$(dircolors -b)"
fi

# ============================== History ==============================
# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

setopt histignorealldups sharehistory

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search


[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search


# ============================== alias ==============================
alias dotfiles="$(which git) --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}"

if test "$(uname)" = "Darwin" ; then
	alias ls='ls -G'
	alias P=proxychains4
else
	alias ls='ls --color'
	alias P=proxychains
fi

alias gitpush='git add . && git commit -m a && git push'
alias gitcommit='git add . && git commit -m a'

alias k='kubectl'

alias sS='screen -S'
alias sls='screen -ls'
alias sr='screen -r'
alias sx='screen -x'

alias tf='terraform'
alias tmux='tmux -u'

alias S='sudo su'


# global alias
alias -g F=' $(fzf)'
alias -g G=' | grep'
alias -g L=' | less'
alias -g N=' > /dev/null'
alias -g T=' | tail'
alias -g Z=' > /dev/zero'

# suffix alias
alias -s {zip,ZIP}="unzip -l"

# ============================== completion ==============================
# Use modern completion system
autoload -Uz compinit && compinit -i

autoload -Uz promptinit
promptinit
prompt adam1

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' menu select=long
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Command auto-correction.
ENABLE_CORRECTION="true"
#
setopt COMPLETE_ALIASES

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $(which terraform) terraform

# add autocomplete permanently to your zsh shell
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); complete -F __start_kubectl k;fi 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


