#!/bin/sh

# Install Homebrew

if type -a brew >/dev/null 2>&1; then
  brew update && brew upgrade
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install formula
brew install colordiff gnu-sed neovim python tmux wget zplug
brew install exiftool ffmpeg mpv numpy pdfpc peco tree youtube-dl

# Neovim: Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install --user pynvim
