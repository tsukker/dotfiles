# Path to your oh-my-zsh installation.
export ZSH=/Users/shunsuke/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="skaro"
#ZSH_THEME="darkblood"
#ZSH_THEME="frontcube"
#ZSH_THEME="juanghurtado"
ZSH_THEME="robbyskarohurtado"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=5

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# platex
export PATH="/Library/TeX/texbin:$PATH"

# Add GHC 7.10.2 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.2.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias g++='g++ -std=c++11 -O2 -Wall -Wextra -Wconversion'
alias prev='open -a Preview'
alias clang++='clang++ -std=c++11 -O2 -Wall'
alias vv='clang++ -std=c++11 -O2 -Wall -o a' # example
alias info='info --vi-keys'
alias cd..='cd ..'
# ls aliases
alias ls='ls'
alias ls='ls -hFG'
alias lsa='ls -lAh'  # cf.
alias l='ls -lAh'    # ~/.oh-my-zsh/
alias ll='ls -lh'    # lib/
alias la='ls -lAh'   # directories.zsh
alias a='ls -Ah'
alias lt='ls -lAhT'

# suffix alias
alias -s rb='ruby'
alias -s {cpp,cc}='runcc'

function runcc() {
  clang++ $1
  shift
  ./a.out $@
}

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Omission of cd & ls
setopt auto_cd
function chpwd() { ls }

# メモリに保存される履歴の件数
export HISTSIZE=10000000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=10000000
# 重複を記録しない
setopt hist_ignore_dups
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開         
setopt hist_expand
# 開始と終了を記録
setopt EXTENDED_HISTORY

zshaddhistory() {
  local line=${1%%$'\n'}
  local cmd=${line%% *}

  # 以下の条件をすべて満たすものだけをヒストリに追加する
  [[ ${cmd} != (l|a|l[sal]|lsa)
  && ${cmd} != (man)
  && ${cmd} != (pwd)
  && ${cmd} != (which)
  && ${cmd} != (info)
##  && ${cmd} != (cat)
  && ${cmd} != (clnag++)
  ]]
}
