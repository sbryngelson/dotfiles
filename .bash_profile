[ -f $HOME/.bashrc ]  &&  source $HOME/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export BOOST_INCLUDE='/opt/homebrew/opt/boost/include'
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/spencer/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/spencer/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/spencer/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/spencer/Downloads/google-cloud-sdk/completion.bash.inc'; fi

