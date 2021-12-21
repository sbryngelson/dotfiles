# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
[ -f $HOME/.aliasrc ]   &&  source $HOME/.aliasrc
[ -f $HOME/.fzf.bash ]  &&  source $HOME/.fzf.bash
[ -f $HOME/.localrc ]   &&  source $HOME/.localrc

# OS-specific stuff

if [ "$(uname -s)" == "Darwin" ]; then
    [ -f $HOME/.gnuplotrc_qt ] &&  source $HOME/.gnuplotrc_qt

    export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
    export PATH="$HOME/.local/bin:$PATH"
    export PATH="/opt/homebrew/bin:$PATH"
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig

    export LDFLAGS="-L/usr/local/opt/readline/lib"
    export CPPFLAGS="-I/usr/local/opt/readline/include"
    export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

    export BAT_THEME="Nord"

    # Fix OpenMPI issue
    export PMIX_MCA_gds=hash

    # Homebrew stuff
    # . $(brew --prefix bash-completion)/etc/bash_completion
    # . /opt/homebrew/bin/bash-completion/etc/bash_completion
    . /opt/homebrew/etc/bash_completion
else
    [ -f $HOME/.gnuplotrc_x11 ] &&  source $HOME/.gnuplotrc_x11
    export PATH="$HOME/.cargo/bin:$PATH"
fi

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

bind '"\C-r": "\C-x1\e^\er"'
bind -x '"\C-x1": __fzf_history';
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --inline-info'
export FZF_DEFAULT_COMMAND='fdd -t d --color=auto . $HOME'

# Prompt 

## Colors
export CLICOLOR=1
export LS_COLORS='di=1;34:ln=1;35:so=1;32:pi=1;33:ex=1;37:bd=34;46:cd=00;34:su=30;41:sg=30;46:tw=30;42:ow=1;34'

## Statement
# takes a number argument of the number of last dirs to show
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

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_CONNECTION" ] ; then
    MYHOST=$(hostname -s)
    MYHOST='@'$MYHOST
    UNAME=$(whoami)
    PROMP=$UNAME$MYHOST
fi
export PS1="\[$(tput bold)\]\[$(tput setaf 5)\]$PROMP \[$(tput setaf 3)\]\$(DIR_LAST 2)\[$(tput setaf 3)\] \[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"

## Push to bottom
# tput cup $LINES
# export PROMPT_COMMAND='(retval=$?;tput cup "$LINES";exit $retval)'
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

# export PATH="/usr/local/opt/ruby/bin:$PATH"

# --- [Added by MFC | Start Section] --- #
if [[ -z "${MFC_ENV_SH_HEADER_GUARD}" ]]; then 
	export MFC_ENV_SH_HEADER_GUARD="SET" 
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/Users/spencer/research/solvers/MFC-develop/dependencies/build/lib" 
fi 
# --- [Added by MFC | End Section] --- #

. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
