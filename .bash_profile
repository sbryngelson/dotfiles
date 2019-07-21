[ -f $HOME/.aliasrc ]   &&  source $HOME/.aliasrc
[ -f $HOME/.inputrc ]   &&  source $HOME/.inputrc
[ -f $HOME/.gnuplotrc ] &&  source $HOME/.gnuplotrc
[ -f $HOME/.pathrc ]    &&  source $HOME/.pathrc
[ -f $HOME/.bashrc ]    &&  source $HOME/.bashrc
[ -f $HOME/.fzf.bash ]  &&  source $HOME/.fzf.bash

shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
# shopt -s cdable_vars

set bell-style none
set colored-stats on
set colored-completion-prefix on
set completion-ignore-case On
set -o vi

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
export EXPAT_LIBS='-L/opt/local/lib -lexpat'
export EXPAT_CFLAGS=' '

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --inline-info'

export CLICOLOR=1
export LS_COLORS='di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43'

if [ "$(uname -s)" == "Darwin" ]; then
    export FZF_DEFAULT_COMMAND='fdd -t d --color=auto . $HOME'
    # export FZF_DEFAULT_COMMAND='fdd . $HOME'
    # export FZF_DEFAULT_COMMAND='rg --files --sort-files $HOME'

    alias ls='gls -GFh --color --group-directories-first'
    # export LSCOLORS=GxFxCxDxBxegedabagGxGx

    # interactive cd
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
else
    alias ls='ls -GFh --color --group-directories-first'
    fd() {
       local file
       local dir
       file=$(fzf +m -q "$1")
       dir=$(dirname "$file")
       cd "$file"
    }
fi





export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\H \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

[ -z "$PS1" ] && return
function cd {
    builtin cd "$@" && ls -F
    }
