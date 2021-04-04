#!/bin/zsh
cd `dirname $0`

# Install Homebrew

if type -a brew >/dev/null 2>&1; then
  brew update && brew upgrade
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install formula
brew bundle --file=$(pwd)/Brewfile

envs="pyenv rbenv"
for somenv in $(echo $envs)
do
  if anyenv envs | grep $somenv >/dev/null 2>&1; then
    :
  else
    anyenv install $somenv
  fi
done
