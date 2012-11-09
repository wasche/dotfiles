. ~/.todo.cfg
. ~/.zsh/todo_completion.zsh

export TODOTXT_DEFAULT_ACTION=ls

alias t="todo.sh"
zstyle ':completion:*:*:t:*' user-commands todo:'description for foo'

alias n="t ls +next"
