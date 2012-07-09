# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

unset USERNAME

if [ -f ~/.motd ]; then
  . ~/.motd
fi
