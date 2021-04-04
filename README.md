# dotfiles

The strongest configuration I thought up

## Environment

- macOS Terminal.app (iTerm.app)
- (Linux version: TBD)

## Usage

### macOS

First of all, Xcode is needed to be installed from App Store to use `git` command.

#### Configure

```sh
cd ~
git clone 'https://github.com/tsukker/dotfiles.git'
cd dotfiles
zsh ./macos.sh
```

#### Manual Operations (Optional)

- IME
  - preferences > IME
  - preferences > Keyboard shortcuts
- Change display resolution
- Disable auto setting of timezone
- Enable Mouse Keys and turn Five-Alt setting on

#### Neovim

```vim
:PlugInstall
:PlugStatus
```

TODO
