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

alias mkdir='noglob mkdir'
alias ll='ls -l'
alias la='ls -Al'

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

alias conflicts="svn st | egrep '^\s*C'"

alias cpu='top -o cpu'
alias mem='top -o vsize'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias history='fc -l 1'
