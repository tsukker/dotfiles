#!/bin/sh

# ln cheat-sheet
# ln -sf [path of the real file (if relative from symbolic link)] [path of symbolic link (if relative from working directory]

# dotfiles under home directory
dotfiles=".tmux.conf .vim .vimrc .zshenv .zshrc"
for dotfile in $dotfiles
do
  ln -sf ~/dotfiles/$dotfile ~/
done

# XDG Base Directory Specification
configdirs="nvim"
for dir in $configdirs
do
  ln -sf ~/dotfiles/.config/$dir ~/.config/
done
