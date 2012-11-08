. ~/.todo.cfg
alias t='todo.sh'
. ~/.bash/todo_completion.bash
complete -F _todo t

export TODOTXT_DEFAULT_ACTION=ls
