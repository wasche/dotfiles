export SVN_EDITOR=vim
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
export DISPLAY=:0.0
export HISTCONTROL=ignoreboth
export ANT_OPTS=-Xmx500M;

if [[ -d /usr/local/node/bin ]]; then
  export PATH=$PATH:/usr/local/node/bin
fi

PS1="[\[\033[31m\]\u\[\033[0m\]@\[\033[31m\]\h\[\033[0m\]:\[\033[1;32m\]\W\[\033[0m\]]\$ "

# rvm - ruby version manager
[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"
