#!/bin/zsh
cd `dirname $0`

# Neovim: Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install --user pynvim
