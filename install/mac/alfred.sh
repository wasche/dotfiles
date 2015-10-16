#!/usr/bin/env bash

brew cask install alfred
defaults write com.runningwithcrayons.Alfred-Preferences syncfolder -string "~/Dropbox/alfred"
