[ -f $HOME/.gnuplotrc_x11 ] &&  source $HOME/.gnuplotrc_x11

# Shell options
# check if autocd exists [then it is a newer Bash version]
shopt | grep 'autocd' &> /dev/null
if [ $? == 0 ]; then
    # Load newer Bash shopt's

    #a command name that is the name of a directory is executed as if it were the argument to the cd command
    shopt -s autocd 

    # If set, Bash attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist.
    shopt -s dirspell 

    # If set, Bash replaces directory names with the results of word expansion when performing filename completion. This changes the contents of the Readline editing buffer. If not set, Bash attempts to preserve what the user typed.
    shopt -s direxpand
fi

# If set, minor errors in the spelling of a directory component in a cd command will be corrected. The errors checked for are transposed characters, a missing character, and a character too many. If a correction is found, the corrected path is printed, and the command proceeds. This option is only used by interactive shells.
shopt -s cdspell

# If this is set, an argument to the cd builtin command that is not a directory is assumed to be the name of a variable whose value is the directory to change to.
# shopt -s cdable_vars

# Vi mode in shell
set -o vi
bind -m vi-insert '"jk":vi-movement-mode'
bind -m vi-command "H":vi-prev-word
bind -m vi-command "L":vi-next-word
bind '"\e[Z": menu-complete-backward'

# Basics
export EDITOR=vim
export VISUAL="$EDITOR"
export TERM=xterm-256color

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Common commands
alias la='ls -a'
alias ll='ls -lhtr'
alias v='vim'
alias grep='grep --color=auto'
alias untar='tar -zxvf '
alias tarup='tar -zcvf'
alias dus='du -hs * | sort -h'
alias c='clear'


if [ -x "$(command -v ffmpeg)" ]; then
    alias pngtompeg="ffmpeg -y -f image2 -r 20 -i D/img_%04d.png -b 5000k movie.mpeg"
fi

# Add colour to man pages
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;38;5;74m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[38;5;246m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[04;38;5;146m'

# Cargo (rust)
if [ -f $HOME/.cargo/env ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
    . "$HOME/.cargo/env"
fi

# Homebrew business
BREWPATH=/opt/homebrew/bin
if test -d $BREWPATH; then
    export PATH=$BREWPATH:$PATH
    eval "$(brew shellenv)"
    [[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

     ## qt
    export PATH="$HOMEBREW_PREFIX/opt/qt@5/bin:$PATH"

     ## 1PW
    source <(op completion bash)

     ##PKG_CONFIG_PATH
    export PKG_CONFIG_PATH="$BREWPATH/readline/lib/pkgconfig"
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig

     ## ruby
    export PATH="$HOMEBREW_PREFIX/lib/ruby/gems/3.3.0/bin:$PATH"
    export PATH="$HOMEBREW_PREFIX/opt/ruby/bin:$PATH"

     ## chruby
    source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
    source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh
fi

# FZF options
if [ -x "$(command -v fzf)" ]; then
    bind '"\C-r": "\C-x1\e^\er"'
    # bind -x '"\C-x1": __fzf_history';
    bind -x '"\C-r": __fzf_history__'

    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --inline-info --bind=ctrl-alt-k:up,ctrl-alt-j:down'
    export FZF_DEFAULT_COMMAND='fdd --no-ignore-vcs -t d --color=auto . $HOME'

    # FZF command
    alias ff="fdd --no-ignore-vcs -H -t f . | fzf"

    function fd() {
        local dir="$(fzf --reverse --preview '
        __cd_nxt="$(echo {})";
        __cd_path="$(echo ${__cd_nxt} | sed "s;//;/;")";
        echo $__cd_nxt; 
        echo;
        ls ${__cd_path};
        ')"
        cd "$dir"
    }

    __fzf_history__() {
      local selected
      # Build “plain command” list (strip the leading history numbers)
      selected=$(
        HISTTIMEFORMAT= history           \
          | tac                            \
          | sed -E 's/^ *[0-9]+[* ]+//'    \
          | fzf --tac --height=40% \
                --bind='ctrl-r:toggle-sort' \
                --query="$READLINE_LINE"
      ) || return                         # ^-- Esc/CTRL-C exits cleanly

      # Drop the command on to the prompt and move cursor to the end
      READLINE_LINE=$selected
      READLINE_POINT=${#READLINE_LINE}
    }

fi

if [ -x "$(command -v bat)" ]; then
    export BAT_THEME="Nord"
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

# Improve some commands
if [ -x "$(command -v gls)" ]; then
    alias ls='gls -GFhN --color=always --group-directories-first'
else
    alias ls='ls -GFh --color'
fi

if [ -x "$(command -v colordiff)" ]; then
    alias diff='colordiff'
fi

# Website
if [ -x "$(command -v bundle)" ]; then
    alias jek='bundle exec jekyll serve'
    alias jekcheck="bundle exec jekyll build; bundle exec htmlproofer ./_site --alt-ignore '/.*/' --http_status_ignore='999,403,301,302' --assume-extension"
fi

# Git
if [ -x "$(command -v git)" ]; then
    alias ga='git add'
    alias gc='git commit'
    alias gp='git push'
fi

alias faster='ssh -J u.sb27915@faster-jump.hprc.tamu.edu:8822 u.sb27915@login.faster.hprc.tamu.edu'

if [ -x "$(command -v sacct)" ]; then
    export SLURM_TIME_FORMAT=relative
    alias q='squeue -S "i" --format="%.9i %.11P %.30j %.8u %.8T %.10M %.12l %.6D %C" | grep --color=auto     "$(whoami)\|$"'
fi 

# `ls after `cd`
prompt_cmd () {
    echo -ne '\033]0;'"$(dirs)"'\a' >&2
}

export PROMPT_COMMAND=prompt_cmd
#each console has its own file to save PWD
PrevDir=$(tty) 
PrevDir=/tmp/prev-dir${PrevDir////-}
#don't ls when shell launched
echo $PWD > $PrevDir
LsAfterCd() {
    [[ "$(< $PrevDir)" == "$PWD" ]] && return 0
    ls 
    echo $PWD > $PrevDir
}
export PROMPT_COMMAND="LsAfterCd;$PROMPT_COMMAND"

# Dotfile stuff
alias installfzf="git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install"
alias installfd="cd ~ && curl https://sh.rustup.rs -sSf | sh && source $HOME/.cargo/env && cargo install fd-find && mv .cargo/bin/fd .cargo/bin/fdd"

[ -f $HOME/.localrc ] &&  source $HOME/.localrc
