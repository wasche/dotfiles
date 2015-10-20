#!/usr/bin/env bash

# Make sure Homebrew is installed and up to date
brew.sh

# Update some core utilities
coreutils.sh

# Install any additional packages/
for $pkg in ./packages/*.sh; do
  if [[ -x "$pkg" ]]; then
    . "$pkg"
  fi
done

# Install/update CaskRoom for application support
caskroom.sh

# Install any additional applications/
for $app in ./applications/*.sh; do
  if [[ -x "$app" ]]; then
    . "$app"
  fi
done

# Update various settings/
for $f in ./settings/*.sh; do
  if [[ -x "$f" ]]; then
    . "$f"
  fi
done

# Lastly, restart affected appliations
restart.sh
