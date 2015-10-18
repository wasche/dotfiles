#!/usr/bin/env bash

# setup terminal and remote support
brew install ssh-copy-id
brew install mosh
brew install tmux

hub clone powerline/fonts
pushd fonts
./install.sh
popd
rm -rf fonts
