#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# start in the home dir
cd ~

# make sure ssh key exists
if [[ ! -f ~/.ssh/id_rsa.pub ]]; then
  ssh-keygen -q
fi
# add ssh key to github
echo "In order to clone your GitHub repos, you need to add this machine's key\nto your account."
read -n 1 -p "Copy key to clipboard and open github.com? (Y/n) " ans
if [ "$ans" -ne "n" ]; then
  cat ~/.ssh/id_rsa.pub | pbcopy
  open 'https://github.com/settings/ssh'
fi

# setup dotfiles
hub clone -p $USER/dotfiles
pushd dotfiles
git submodule init
git submodule update
make
popd
