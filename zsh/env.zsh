export EDITOR="vim"

export CC="gcc"

export ANT_HOME=/usr/local/ant
export ANT_OPTS=-Xmx500M;

export NODE_ENV='development'

autoload -U compinit
compinit

# make zsh not kill background jobs when it closes
setopt nohup

unsetopt clobber multibyte
setopt extended_history auto_pushd inc_append_history hist_ignore_dups
setopt hist_verify auto_continue multios interactive_comments autocd
setopt extended_glob notify list_ambiguous

# use vi style keybinds
bindkey -v

DIRSTACKSIZE=50
limit coredumpsize 10m
HISTSIZE=20000
HISTFILE=~/.zsh/history
SAVEHIST=20000

zsh-fg()
{
  if (( ${#jobstates} )); then
    zle .push-input
    [[ -o hist_ignore_space ]] && BUFFER=' ' || BUFFER=''
    BUFFER="${BUFFER}fg"
    zle .accept-line
  else
    zle -M 'No background jobs. Doing nothing.'
  fi
}
zle -N zsh-fg
bindkey '^z' zsh-fg

# run command line as user root via sudo:
sudo-command-line()
{
  [[ -z $BUFFER ]] && zle up-history
  if [[ $BUFFER != sudo\ * ]]; then
    BUFFER="sudo $BUFFER"
    CURSOR=$(( CURSOR+5 ))
  fi
}
zle -N sudo-command-line
bindkey '^Os' sudo-command-line

autoload zkbd
# setup key accordingly
# vim-style keybinds - hit ESC then these
[[ -n "${key[Home]}" ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[End]}" ]] && bindkey "${key[End]}" end-of-line
[[ -n "${key[Insert]}" ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n "${key[Delete]}" ]] && bindkey "${key[Delete]}" delete-char
[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" history-substring-search-up
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" history-substring-search-down
[[ -n "${key[Left]}" ]] && bindkey "${key[Left]}" backward-char
bindkey ";5D" backward-word
bindkey ";5C" forward-word

[[ -f /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

[[ -f ~/.dir_colors ]] && which dircolors >/dev/null 2>&1 && eval "`dircolors ~/.dir_colors -b`"

zle_highlight=(region:underline
               special:bold
              )

# grep
export GREP_COLOR='1;32'
