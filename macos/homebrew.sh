#!/bin/sh

# Install Homebrew

if type -a brew >/dev/null 2>&1; then
  brew update && brew upgrade
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install formula
brew bundle --file=~/dotfiles/macos/Brewfile
