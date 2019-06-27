try_alias() {
  cmd=$1
  shift
  "$@" >/dev/null 2>&1 && alias $cmd="$*"
}

try_which() {
  cmd=$1
  shift
  which "$@" >/dev/null 2>&1 && alias $cmd="$*"
}

try_alias ls ls --color=auto || try_alias ls ls -G
try_alias grep grep --color=auto

alias mkdir='noglob mkdir'
alias ll='ls -lh'
alias la='ls -Alh'

try_which gitk gitview
alias ga="gitk --all $|"

alias v='vim'

#mvim_remote()
#{
#  if [[ $# > 0 ]]; then
#    mvim --remote-silent "$@"
#  else
#    mvim "$@"
#  fi
#}
#if which mvim >/dev/null 2>&1; then
#  alias vim="mvim_remote"
#  alias V='\vim -'
#else
#  alias V='vim -'
#fi

alias jobs='jobs -dlp'

alias cpu='top -o cpu'
alias mem='top -o vsize'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

alias history='fc -l 1'

isword()
{
  grep $1 /usr/share/dict/words
}

mount-ssh()
{
  if [[ $# -ge 2 ]]; then
    user=`whoami`
    host=$1
    branch=$2
    remote_path="src/$branch"
    local_path="${host}-$branch"
    shift;shift
    if [[ $# -eq 1 ]]; then
      local_path=$1
      shift
    fi
    mkdir -p $local_path
    echo "sshfs -oauto_cache,reconnect,defer_permissions,negative_vncache,noappledouble,idmap=user,volname=$branch $user@$host:$remote_path $local_path"
    sshfs -oauto_cache,reconnect,defer_permissions,negative_vncache,noappledouble,idmap=user,volname=$branch $user@$host:$remote_path $local_path
  else
    echo "Usage: mount-ssh [user] host branch [local_path]"
    return 2
  fi
}

function regex { perl -lne '@a=m|'$1'|g;print "@a"' }

alias silverfish='mosh --server=/usr/local/bin/mosh-server silverfish "tmux attach || tmux new"'

# Creates Node container with mapped current folder and runs Bash shell
alias node-box='docker run -v $PWD:/src -w /src -u node -it node /bin/bash'
