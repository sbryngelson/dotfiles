[ -f $HOME/.bashrc ]  &&  source $HOME/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export BOOST_INCLUDE='/opt/homebrew/opt/boost/include'
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/spencer/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/spencer/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/spencer/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/spencer/Downloads/google-cloud-sdk/completion.bash.inc'; fi


# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=bash)"

# Created by `pipx` on 2026-06-27 22:02:46
export PATH="$PATH:/Users/spencer/.local/bin"
