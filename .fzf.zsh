# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/spencer/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/spencer/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/spencer/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/spencer/.fzf/shell/key-bindings.zsh"
