#!/usr/bin/env bash

brew cask install sizeup

# Start SizeUp at login
defaults write -app SizeUp StartAtLogin -bool true

# Don’t show the preferences window on next start
defaults write -app SizeUp ShowPrefsOnNextStart -bool false

# set shortcuts
defaults write -app SizeUp Left -dict ComboCode -int 0 ComboFlags -int 786432 Height -int 1 Width -float 0.5 X -int 0 Y -int 0
defaults write -app SizeUp Right -dict ComboCode -int 2 ComboFlags -int 786432 Height -int 1 Width -float 0.5 X -float 0.5 Y -int 0
defaults write -app SizeUp Up -dict ComboCode -int 13 ComboFlags -int 786432 Height -float 0.5 Width -int 1 X -int 0 Y -int 0
defaults write -app SizeUp Down -dict ComboCode -int 1 ComboFlags -int 786432 Height -float 0.5 Width -int 1 X -int 0 Y -float 0.5

defaults write -app SizeUp "Upper Left" -dict ComboCode -int 12 ComboFlags -int 786432 Height -float 0.5 Width -float 0.5 X -int 0 Y -int 0
defaults write -app SizeUp "Upper Right" -dict ComboCode -int 14 ComboFlags -int 786432 Height -float 0.5 Width -float 0.5 X -float 0.5 Y -int 0
defaults write -app SizeUp "Lower Left" -dict ComboCode -int 6 ComboFlags -int 786432 Height -float 0.5 Width -float 0.5 X -int 0 Y -float 0.5
defaults write -app SizeUp "Lower Right" -dict ComboCode -int 8 ComboFlags -int 786432 Height -float 0.5 Width -float 0.5 X -float 0.5 Y -float 0.5

defaults write -app SizeUp "Full Screen" -dict ComboCode -int 3 ComboFlags -int 786432 Heigt -int 1 Width -int 1 x -int 0 y -int 0
defaults write -app SizeUp Center -dict ComboCode -int 7 ComboFlags -int 786432

defaults write -app SizeUp SnapBack -dict ComboCode -int 11 ComboFlags -int 786432

defaults write -app SizeUp "Prev Monitor" -dict ComboCode -int "-1" ComboFlags -int 0
defaults write -app SizeUp "Next Monitor" -dict ComboCode -int "-1" ComboFlags -int 0

defaults write -app SizeUp "Space Prev" -dict ComboCode -int "-1" ComboFlags -int 0
defaults write -app SizeUp "Space Next" -dict ComboCode -int "-1" ComboFlags -int 0
defaults write -app SizeUp "Space Above" -dict ComboCode -int "-1" ComboFlags -int 0
defaults write -app SizeUp "Space Below" -dict ComboCode -int "-1" ComboFlags -int 0

open ~/Applications/SizeUp.app
