[ -f $HOME/.fzf.bash ]      &&  source $HOME/.fzf.bash
[ -f $HOME/.gnuplotrc_x11 ] &&  source $HOME/.gnuplotrc_x11
[ -f $HOME/.localrc ]       &&  source $HOME/.localrc

# Shell options

# check if autocd exists [then it is a newer Bash version]
shopt | grep 'autocd' &> /dev/null
if [ $? == 0 ]; then
    # Load newer Bash shopt's
    shopt -s autocd
    shopt -s dirspell
    shopt -s direxpand
fi
shopt -s cdspell
shopt -s cdable_vars

# Vi mode in shell
set -o vi
bind -m vi-insert '"jk":vi-movement-mode'
bind -m vi-command "H":vi-prev-word
bind -m vi-command "L":vi-next-word
bind '"\e[Z": menu-complete-backward'

# Environment variables
export EDITOR=vim
export VISUAL="$EDITOR"
export TERM=xterm-256color

# Fuzzy file finder options
if command -v fzf &> /dev/null
then
    bind '"\C-r": "\C-x1\e^\er"'
    bind -x '"\C-x1": __fzf_history';
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --inline-info --bind=ctrl-alt-k:up,ctrl-alt-j:down'
    export FZF_DEFAULT_COMMAND='fdd --no-ignore-vcs -t d --color=auto . $HOME'
fi

# Prompt 
export CLICOLOR=1
export LS_COLORS='di=1;34:ln=1;35:so=1;32:pi=1;33:ex=1;37:bd=34;46:cd=00;34:su=30;41:sg=30;46:tw=30;42:ow=1;34'
export PS1="\[$(tput bold)\]\[$(tput setaf 8)\]$(hostname -s):\[$(tput setaf 5)\]$PROMP \[$(tput setaf 3)\]\$(DIR_LAST 2)\[$(tput setaf 3)\] \[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"

# Statement
## takes a number argument of the number of last dirs to show
function DIR_LAST {
    # read -a didn't seem to work under bash 3
    IFS='/' array=($PWD)
    len=${#array[@]}
    start=$((len - $1))
    # leading / if fewer dir args: /usr/flastname not usr/flastname
    if (( $start <= 1 )); then
        start=1
        echo -n /
    fi
    for (( i = $start; $i < $len; i++ )); do
        if (( $i > $start )); then
            echo -n /
        fi
        echo -n ${array[$i]}
    done
}

# Add colour to man pages
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;38;5;74m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[38;5;246m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[04;38;5;146m'

# Cargo
if [ -f $HOME/.cargo/env ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
    . "$HOME/.cargo/env"
fi

[ -f $HOME/.aliasrc ] && source $HOME/.aliasrc
