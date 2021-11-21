#!/bin/zsh
cd `dirname $0`

# ln cheat-sheet
# ln -sf [path of the real file (if relative from symbolic link)] [path of symbolic link (if relative from working directory]

# dotfiles under home directory
dotfiles=".editorconfig .tmux.conf .vim .vimrc .zshenv .zshrc"
for dotfile in $(echo $dotfiles)
do
  ln -sf $(pwd)/$dotfile ~/
done

# ~/.gitconfig
git config --global core.excludesfile ~/.gitignore_global  # Apply .gitignore_global
git config --global core.editor 'vim -c "set fenc=utf-8"'

# XDG Base Directory Specification
mkdir -p ~/.config
configdirs="git nvim"
for dir in $(echo $configdirs)
do
  ln -sf $(pwd)/.config/$dir ~/.config/
done
