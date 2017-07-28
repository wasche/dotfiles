#!/usr/bin/env bash

# setup terminal and remote support
brew install ssh-copy-id
brew install mosh
brew install tmux

git clone https://github.com/powerline/fonts.git /tmp/powerline-fonts
pushd /tmp/powerline-fonts
./install.sh
popd
rm -rf /tmp/powerline-fonts
