. ~/.todo.cfg
. ~/.zsh/todo_completion.zsh

export TODOTXT_DEFAULT_ACTION=ls

alias t="todo.sh -t"
zstyle ':completion:*:*:t:*' user-commands todo:'description for foo'

