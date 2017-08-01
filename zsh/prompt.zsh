autoload colors zsh/terminfo
colors

autoload -Uz vcs_info

parse_git_dirty()
{
  gitstat=$(git status 2>/dev/null | grep '\(^Untracked\|^Changes\|^Changed but not updated:\)')

  if [[ $(echo ${gitstat} | grep -c "^Changes to be committed:$") > 0 ]]; then
    echo -n "!"
  fi

  if [[ $(echo ${gitstat} | grep -c "^\(Untracked files:\|Changed but not updated:\)$") > 0 ]]; then
    echo -n "?"
  fi

  if [[ $(echo ${gitstat} | grep -v '^$' | wc -l | tr -d ' ') == 0 ]]; then
    echo -n ""
  fi

}

get_svn_cmd()
{
  which "svn.real" >/dev/null 2>&1 && echo "svn.real" && return
  echo "svn"
}

update_prompt()
{
  # colors
  local _bo=$'\e[48;2;255;135;0m';   _bo="%{$_bo%}"
  local _bg=$'\e[48;2;58;58;58m';    _bg="%{$_bg%}"
  local _cg=$'\e[38;2;58;58;58m';    _cg="%{$_cg%}"
  local _co=$'\e[38;2;255;135;0m';   _co="%{$_co%}"
  local _cw=$'\e[38;2;244;244;244m'; _cw="%{$_cw%}"
  local _cb="%{$fg[black]%}"
  local _r="%{$reset_color%}"

  # the actual prompt
  PROMPT="$_co$_bg$_cw %2~"

  if ! { [ "$TERM" = "screen-256color" ] && [ -n "$TMUX" ]; } then
    PROMPT="$_bo$_cb %n  %m $PROMPT"
  fi

  SVN="$(get_svn_cmd)"

  if $($SVN info >/dev/null 2>&1); then
    export SVN_REV=$($SVN info | grep 'Revision: ' | cut -f 2 -d ' ')
    export SVN_DIR=$PWD
    if [[ ! -z "$SVN_BRANCH" ]]; then
      PROMPT="$PROMPT $SVN_BRANCH"
    fi
    if [[ ! -z "$SVN_REV" ]]; then
      PROMPT="$PROMPT r$SVN_REV"
    fi
  elif $(git branch >/dev/null 2>&1); then
    ref=$(git symbolic-ref HEAD 2>/dev/null) || return
    export GIT_BRANCH=${ref#refs/heads/}

    PROMPT="$PROMPT  ⭠$GIT_BRANCH$(parse_git_dirty)"
  fi

  PROMPT=$'\n'"$PROMPT $_r$_cg$_r "
}

precmd()
{
  update_prompt
}
