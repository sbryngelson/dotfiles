[ -f $HOME/.aliasrc ]   &&  source $HOME/.aliasrc
[ -f $HOME/.bashrc ]    &&  source $HOME/.bashrc
[ -f $HOME/.fzf.bash ]  &&  source $HOME/.fzf.bash

# Input
shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s direxpand
shopt -s cdable_vars

# Vi mode in shell
set -o vi
bind -m vi-insert '"jk":vi-movement-mode'
bind -m vi-command "H":vi-prev-word
bind -m vi-command "L":vi-next-word
bind '"\e[Z": menu-complete-backward'

# Add to path
export PATH="/usr/local/sbin:$PATH"

# Environment variables
export EDITOR=vim
export VISUAL="$EDITOR"
export TERM=xterm-256color

# Expat?
export EXPAT_LIBS='-L/opt/local/lib -lexpat'
export EXPAT_CFLAGS=' '

# Fuzzy file finder options
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --inline-info'
export FZF_DEFAULT_COMMAND='fdd -t d --color=auto . $HOME'

# Prompt 

## Colors
export CLICOLOR=1
export LS_COLORS='di=1;34:ln=1;35:so=1;32:pi=1;33:ex=1;37:bd=34;46:cd=00;34:su=30;41:sg=30;46:tw=30;42:ow=1;34'

## Statement
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 1)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 5)\]\H \[$(tput setaf 3)\]\W\[$(tput setaf 3)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

## Push to bottom
# tput cup $LINES
# export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND='(retval=$?;tput cup "$LINES";exit $retval)'

# OS-specific stuff
if [ "$(uname -s)" == "Darwin" ]; then
    [ -f $HOME/.gnuplotrc_qt ] &&  source $HOME/.gnuplotrc_qt
    # if [ -f /usr/local/bin/gls ]; then
    if [ ! command -v gls &> /dev/null ]; then
        alias ls='ls -G'
    else
        alias ls='gls -GFhN --color --group-directories-first'
    fi

    alias copy="pbcopy"
    function fd() {
        local dir="$(fzf --reverse --preview '
        __cd_nxt="$(echo {})";
        __cd_path="$(echo ${__cd_nxt} | sed "s;//;/;")";
        echo $__cd_nxt; 
        echo;
        gls -GFh --color --group-directories-first ${__cd_path};
        ')"
        cd "$dir"
    }
    # [ -z "$PS1" ] && return
    function cd {
        # builtin cd "$@" && ls -F
        builtin cd "$@" && gls -GFhN --color --group-directories-first
        }
    eval "$(rbenv init -)"
else
    [ -f $HOME/.gnuplotrc_x11 ] &&  source $HOME/.gnuplotrc_x11
    alias copy="xclip -selection c"
    alias ls='ls -GFhN --color --group-directories-first'
    function fd() {
        local dir="$(fzf --reverse --preview '
        __cd_nxt="$(echo {})";
        __cd_path="$(echo ${__cd_nxt} | sed "s;//;/;")";
        echo $__cd_nxt; 
        echo;
        ls -GFh --color --group-directories-first ${__cd_path};
        ')"
        cd "$dir"
    }
    export PATH="$HOME/.cargo/bin/:$PATH"
    function cd {
        # builtin cd "$@" && ls -F
        builtin cd "$@" && ls -GFhN --color --group-directories-first
        }
fi
