export WHTOP="$HOME/src/warehouse"

findtrtop()
{
	candidate=$PWD
	while true; do
		if [[ -e "$candidate/GNUmaster" &&  -e "$candidate/tr" && -e "$candidate/Crawlers" ]]; then
			trtop $candidate
			break;
		else
			nextcandidate=${candidate%/*}
			if [[ "v$nextcandidate" == "v$candidate" || "v$nextcandidate" == "v" ]]; then
			break;
			fi
			candidate=$nextcandidate;
		fi
	done
}

trtop()
{
	if (( $# == 1 )); then
		oldscripts=$TRTOP/scripts:$TRTOP/scripts/build
		export TRTOP=$1
		export PATH=${PATH//:$oldscripts}:$TRTOP/scripts:$TRTOP/scripts/build
    export SVN_BRANCH=$(svntr branch)    
	else
		echo $TRTOP
	fi
}

# define profiles based on directories:
zstyle ':chpwd:profiles:/Users/wasche/src/*' profile ta
zstyle ':chpwd:profiles:/home/site/*' profile ta
zstyle ':chpwd:profiles:/home/wasche/src/*' profile ta

# configuration for profile 'ta':
chpwd_profile_ta()
{
  # make sure to run it if current dir it outside $TRTOP
  [[ ${PWD#${TRTOP}} == $PWD ]] && findtrtop && return 0
  # skip if current dir is under $TRTOP
  [[ ${${PWD#${TRTOP}}:0:1} == "/" ]] && return 1
  findtrtop
}
