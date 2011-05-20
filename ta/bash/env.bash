export WHTOP='/Users/wasche/src/warehouse'

if [ -n "${SVNTR_SUBSHELL:+x}" ]; then
  PS1="[\[\033[31m\]\u\[\033[0m\]@\[\033[31m\]\h\[\033[0m\]:\[\033[1;32m\]\W\[\033[0m\] SVN]\$ "
else
  PS1="[\[\033[31m\]\u\[\033[0m\]@\[\033[31m\]\h\[\033[0m\]:\[\033[1;32m\]\W\[\033[0m\]]\$ "
fi
