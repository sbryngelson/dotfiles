# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/spencer/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/spencer/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/spencer/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/spencer/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# export PATH="/usr/local/opt/llvm@8/bin:$PATH"
# export PATH="/usr/local/opt/llvm@9/bin:$PATH"

[ -f $HOME/.bashrc ]  &&  source $HOME/.bashrc

export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu8.23.0.3-jdk8.0.144-macosx_x64"

# --- [Added by MFC | Start Section] --- #
if [[ -z "${MFC_ENV_SH_HEADER_GUARD}" ]]; then 
	export MFC_ENV_SH_HEADER_GUARD="SET" 
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/Users/spencer/research/solvers/MFC-develop/dependencies/build/lib" 
fi 
# --- [Added by MFC | End Section] --- #

. "$HOME/.cargo/env"
