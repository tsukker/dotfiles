#!/bin/zsh

# ln cheat-sheet
# ln -sf [path of the real file (if relative from symbolic link)] [path of symbolic link (if relative from working directory]

# dotfiles under home directory
dotfiles=".editorconfig .tmux.conf .vim .vimrc .zshenv .zshrc .gitignore_global"
for dotfile in $(echo $dotfiles)
do
  ln -sf ~/dotfiles/$dotfile ~/
done

# ~/.gitconfig
git config --global core.excludesfile ~/.gitignore_global  # Apply .gitignore_global
git config --global core.editor 'vim -c "set fenc=utf-8"'

# XDG Base Directory Specification
mkdir ~/.config > /dev/null 2>&1
configdirs="nvim"
for dir in $configdirs
do
  ln -sf ~/dotfiles/.config/$dir ~/.config/
done
