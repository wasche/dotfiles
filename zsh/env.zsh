
bindkey -v

if [[ -d ~/.gem/ruby/ ]] && ls ~/.gem/ruby/ >/dev/null 2>&1; then
  for dir in ~/.gem/ruby/*; do
    if [[ -d $dir/bin ]]; then
      export PATH="$dir/bin:$PATH"
    fi
  done
fi

if which mvim >/dev/null 2>&1; then
  export EDITOR="mvim -f"
else
  export EDITOR="vim"
fi

export CC="gcc"

export ANT_HOME=/usr/local/ant

autoload -U compinit colors
compinit
colors

# make zsh not kill background jobs when it closes
setopt nohup

unsetopt clobber
setopt extended_history auto_pushd inc_append_history hist_ignore_dups
setopt hist_verify auto_continue multios interactive_comments autocd
setopt extended_glob notify list_ambiguous

DIRSTACKSIZE=50
limit coredumpsize 10m

HISTSIZE=20000
mkdir -p ~/.zsh
HISTFILE=~/.zsh/history
SAVEHIST=20000

autoload zkbd
# setup key accordingly
[[ -n "${key[Home]}" ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[End]}" ]] && bindkey "${key[End]}" end-of-line
[[ -n "${key[Insert]}" ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n "${key[Delete]}" ]] && bindkey "${key[Delete]}" delete-char
[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" up-line-or-history
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-history
[[ -n "${key[Left]}" ]] && bindkey "${key[Left]}" backward-char
bindkey ";5D" backward-word
bindkey ";5C" forward-word

[[ -f /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
[[ -f ~/.dir_colors ]] && which dircolors >/dev/null 2>&1 && eval "`dircolors ~/.dir_colors -b`"

autoload -Uz vcs_info

local prompt_color
if [[ $SSH_CLIENT == "" ]]; then
  local prompt_color=cyan
else
  local prompt_color=green
fi

if [[ $UID == 0 ]]; then
  local prompt_color=red
fi

local bgc="%B%F{black}"
local fgc="%b%F{$prompt_color}"
local error="%F{red}"
local jobcolor="%F{blue}"
local reset="%b%f"
if [[ $(echo $ZSH_VERSION | cut -d. -f3) < 9 ]]; then
  local bgc="%{$fg_bold[black]%}"
  local fgc="%{$fg_no_bold[$prompt_color]%}"
  local error="%{$fg[red]%}"
  local jobcolor="%{$fg[blue]%}"
  local reset="%{$reset_color%}"
fi
export PS1="$bgc($fgc%n$bgc@$fgc%m$bgc|$fgc%h$bgc @$fgc%t$bgc){$fgc%~$bgc}$reset"
export PS1="${PS1}
$bgc-$fgc%#$reset "
export RPS1="$bgc(%b%1(j,$jobcolor,$reset)%j %(?,$reset,$error)%?$reset"

local bgc=${bgc//[%]b/%%b}
local fgc=${fgc//[%]b/%%b}
local reset=${reset//[%]b/%%b}

zle_highlight=(region:underline
               special:bold
              )

