[ -f $HOME/.aliasrc ]   &&  source $HOME/.aliasrc
[ -f $HOME/.inputrc ]   &&  source $HOME/.inputrc
[ -f $HOME/.gnuplotrc ] &&  source $HOME/.gnuplotrc
[ -f $HOME/.pathrc ]    &&  source $HOME/.pathrc
[ -f $HOME/.bashrc ]    &&  source $HOME/.bashrc
[ -f $HOME/.fzf.bash ]  &&  source $HOME/.fzf.bash

set bell-style none
set colored-stats on
set colored-completion-prefix on
set completion-ignore-case On
set -o vi

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
export EXPAT_LIBS='-L/opt/local/lib -lexpat'
export EXPAT_CFLAGS=' '

export CLICOLOR=1
if [ "$(uname -s)" == "Darwin" ]; then
    export LSCOLORS=GxFxCxDxBxegedabagaced
else
    export LSCOLORS=di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43
fi

shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

#PS1="\[\033[1;32m\][\[\033[0m\] \[\033[1;36m\]\w\[\033[0m\] \[\033[1;32m\]]$\[\033[0m\] "

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\H \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

[ -z "$PS1" ] && return
function cd {
    builtin cd "$@" && ls -F
    }
