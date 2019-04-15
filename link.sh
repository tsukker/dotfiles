# ln -sf [path of the real file (if relative from symbolic link)] [path of symbolic link (if relative from working directory]

dotfiles=".tmux.conf .vimrc .zshenv .zshrc"
for dotfile in $dotfiles
do
    ln -sf ~/dotfiles/$dotfile ~/$dotfile
done
