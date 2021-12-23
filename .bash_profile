[ -f $HOME/.bashrc ]  &&  source $HOME/.bashrc

# --- [Added by MFC | Start Section] --- #
if [[ -z "${MFC_ENV_SH_HEADER_GUARD}" ]]; then 
	export MFC_ENV_SH_HEADER_GUARD="SET" 
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/Users/spencer/research/solvers/MFC-develop/dependencies/build/lib" 
fi 
# --- [Added by MFC | End Section] --- #
