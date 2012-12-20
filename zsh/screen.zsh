# if $SSH_TTY set and $STY is not set...
if [ -n "$PS1" -a -n "$SSH_TTY" -a -z "$STY" ]; then
  exec screen -ADRR
fi
