. ~/.zsh/todo_completion.zsh

export TODOTXT_DEFAULT_ACTION=ls
export TODOTXT_SORT_COMMAND='env LC_COLLATE=c sort -k 2,2 -k 1,1n'

function t() {
  if [ $# -eq 0 ]; then
    todo.sh ls
  else
    todo.sh $*
  fi
}
zstyle ':completion:*:*:t:*' user-commands flow:'description for foo'

alias n="t ls +next"
