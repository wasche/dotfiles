#!/usr/bin/env bash

brew cask install sizeup
# Start SizeUp at login
defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true
# Don’t show the preferences window on next start
defaults write com.irradiatedsoftware.SizeUp ShowPrefsOnNextStart -bool false
