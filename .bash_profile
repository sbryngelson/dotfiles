[ -f $HOME/.aliasrc ]   &&  source $HOME/.aliasrc
[ -f $HOME/.inputrc ]   &&  source $HOME/.inputrc
[ -f $HOME/.gnuplotrc ] &&  source $HOME/.gnuplotrc

[ -f $HOME/.pathrc ]    &&  source $HOME/.pathrc
[ -f $HOME/.darwinrc ]  &&  source $HOME/.darwinrc
[ -f $HOME/.fzf.bash ]  &&  source $HOME/.fzf.bash

set bell-style none
set colored-stats on
set colored-completion-prefix on
set -o vi

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
export EXPAT_LIBS='-L/opt/local/lib -lexpat'
export EXPAT_CFLAGS=' '

shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

PS1="\[\033[1;32m\][\[\033[0m\] \[\033[1;36m\]\w\[\033[0m\] \[\033[1;32m\]]$\[\033[0m\] "
[ -z "$PS1" ] && return
function cd {
    builtin cd "$@" && ls -F
    }
