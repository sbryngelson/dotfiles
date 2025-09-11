[ -f $HOME/.bashrc ]  &&  source $HOME/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export BOOST_INCLUDE='/opt/homebrew/opt/boost/include'
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
