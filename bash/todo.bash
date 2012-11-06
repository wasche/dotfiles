alias t='todo.sh'
. ~/.bash/todo_completion.bash
complete -F _todo t

export TODOTXT_DEFAULT_ACTION=ls
export TODOTXT_SORT_COMMAND='env LC_COLLATE=c sort -k 2,2 -k 1,1n'
