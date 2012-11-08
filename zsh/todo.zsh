. ~/.todo.cfg
. ~/.zsh/todo_completion.zsh

export TODOTXT_DEFAULT_ACTION=ls

function t() {
  if [ $# -eq 0 ]; then
    todo.sh ls
  else
    todo.sh $*
  fi
}
zstyle ':completion:*:*:t:*' user-commands flow:'description for foo'

alias n="t ls +next"
