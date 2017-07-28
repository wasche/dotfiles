#!/usr/bin/env bash

brew cask install iterm2

# https://www.iterm2.com/documentation-hidden-settings.html


if [[ "$TERM_PROGRAM" == "iTerm.app" ]] ; then
  warn "You appear to be running this script from within iTerm.app which could"
  warn "overwrite your new preferences on quit.\n"
  warn "Please quit iTerm and run this from Terminal.app or an SSH session.\n"
  exit 3
fi

if ps wwwaux | egrep -q 'iTerm\.app' >/dev/null ; then
  warn "You appear to have iTerm.app currently running. Please quit the"
  warn "application so your updates won't get overridden on quit.\n"
  exit 4
fi

defaults write -app iTerm PrefsCustomFolder "/Users/wasche/Dropbox/sync/iTerm"
