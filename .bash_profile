[ -f $HOME/.aliasrc ]   &&  source $HOME/.aliasrc
[ -f $HOME/.inputrc ]   &&  source $HOME/.inputrc
[ -f $HOME/.pathrc ]    &&  source $HOME/.pathrc
[ -f $HOME/.bashrc ]    &&  source $HOME/.bashrc
[ -f $HOME/.fzf.bash ]  &&  source $HOME/.fzf.bash

shopt -s autocd
shopt -s cdspell
shopt -s dirspell

set bell-style none
set colored-stats on
set colored-completion-prefix on
set completion-ignore-case On

set -o vi
bind -m vi-insert '"jk":vi-movement-mode'
bind -m vi-command "H":vi-prev-word
bind -m vi-command "L":vi-next-word

# bind '"\e\I": menu-complete'
bind '"\e[Z": menu-complete-backward'

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
export EXPAT_LIBS='-L/opt/local/lib -lexpat'
export EXPAT_CFLAGS=' '

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --inline-info'
export FZF_DEFAULT_COMMAND='fdd -t d --color=auto . $HOME'
# export FZF_DEFAULT_COMMAND='rg --files --sort-files $HOME'

export CLICOLOR=1
export LS_COLORS='di=1;34:ln=1;35:so=1;32:pi=1;33:ex=00:bd=34;46:cd=00;34:su=30;41:sg=30;46:tw=30;42:ow=1;34'
# export LS_COLORS='di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43'

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 1)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 5)\]\H \[$(tput setaf 3)\]\W\[$(tput setaf 3)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

if [ "$(uname -s)" == "Darwin" ]; then
    [ -f $HOME/.gnuplotrc ] &&  source $HOME/.gnuplotrc_qt
    alias ls='gls -GFhN --color --group-directories-first'
    # export LSCOLORS=GxFxCxDxBxegedabagGxGx
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
    [ -z "$PS1" ] && return
    function cd {
        # builtin cd "$@" && ls -F
        builtin cd "$@" && gls -GFhN --color --group-directories-first
        }
else
    [ -f $HOME/.gnuplotrc ] &&  source $HOME/.gnuplotrc_x11
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


