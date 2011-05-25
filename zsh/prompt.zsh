autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then colors; fi

autoload -Uz vcs_info

parse_git_dirty()
{
  gitstat=$(git status 2>/dev/null | grep '\(# Untracked\|# Changes\|# Changed but not updated:\)')

  if [[ $(echo ${gitstat} | grep -c "^# Changes to be committed:$") > 0 ]]; then
    echo -n "!"
  fi

  if [[ $(echo ${gitstat} | grep -c "^\(# Untracked files:\|# Changed but not updated:\)$") > 0 ]]; then
    echo -n "?"
  fi

  if [[ $(echo ${gitstat} | grep -v '^$' | wc -l | tr -d ' ') == 0 ]]; then
    echo -n ""
  fi

}

# colors
local cm="%{$fg[magenta]%}"
local cy="%{$fg[yellow]%}"
local cg="%{$fg[green]%}"
local cG="%{$fg_bold[green]%}"
local cc="%{$fg[cyan]%}"
local c="%{$reset_color%}"

# the actual prompt
PROMPT="$cm%n$c@$cy%m$c:$cG%2~$c> "
BASE_RPROMPT="%B%?%b $c$cg%*$c"

RPROMPT=$BASE_RPROMPT

get_svn_cmd()
{
  which "svn.real" >/dev/null 2>&1 && echo "svn.real" && return
  echo "svn"
}

update_prompt()
{
  export RPROMPT="$BASE_RPROMPT"

  if [[ -d ./.svn ]]; then
    SVN="$(get_svn_cmd)"
    export SVN_REV=$($SVN info | grep 'Revision: ' | cut -f 2 -d ' ')
    export SVN_DIR=$PWD
    if [[ ! -z "$SVN_BRANCH" ]]; then
      export RPROMPT="$RPROMPT $cm$SVN_BRANCH$c"
    fi
    if [[ ! -z "$SVN_REV" ]]; then
      export RPROMPT="$RPROMPT ${cc}r$SVN_REV$c"
    fi
  elif $(git branch >/dev/null 2>/dev/null); then
    ref=$(git symbolic-ref HEAD 2>/dev/null) || return
    export GIT_BRANCH=${ref#refs/heads/}

    export RPROMPT="$RPROMPT $cm$GIT_BRANCH$cg$(parse_git_dirty)$c"
  fi
}

precmd()
{
  update_prompt
}
