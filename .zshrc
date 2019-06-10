## zplug settings
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug"

zplug "b4b4r07/enhancd", \
    use:init.sh

zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf", \
    frozen:1

zplug "peco/peco", \
    as:command, \
    from:gh-r, \
    frozen:1

zplug "zsh-users/zsh-completions"

zplug "zsh-users/zsh-history-substring-search"

zplug "zsh-users/zsh-syntax-highlighting"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
      echo; zplug install
  fi
fi
zplug load --verbose

autoload -U compinit && compinit
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}' '+m:{-_}={_-}' '+l:|=*'
## TODO: set substitution in regular expression

## title bar settings
# show current directory
precmd() { eval 'echo -ne "\033]0;$PWD\007"' }

## prompt settings

setopt prompt_subst
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:*" get-revision true # %i, git hash revision
zstyle ':vcs_info:*' max-exports 3
zstyle ":vcs_info:git:*" stagedstr "<C>" # %c
zstyle ":vcs_info:git:*" unstagedstr "<A>" # %u
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats \
    "(%F{magenta}%b%f)" \
    "%c%u" "%i"
zstyle ':vcs_info:*' actionformats \
    "(%F{magenta}%b%f) %F{red}!%f%a" \
    "%c%u" \
    "%i"

my_git_info_push () {
  if [ "$(git remote 2>/dev/null)" != "" ]; then
    local head="$(git rev-parse HEAD)"
    local remote
    for remote in $(git rev-parse --remotes) ; do
      if [ "$head" = "$remote" ]; then return 0 ; fi
    done
    # pushしていないcommitがあることを示す文字列
    echo "<P>"
  fi
}

# git：stashに退避したものがあるかチェックする
my_git_info_stash () {
  if [ "$(git stash list 2>/dev/null)" != "" ]; then
    # stashがあることを示す文字列
    echo "{s}"
  fi
}

left_vcs_info () {
  vcs_info
  if [ "$vcs_info_msg_0_" = "" ]; then
    return 0
  fi
  echo $vcs_info_msg_0_" "
}

indicator_vcs_info () {
  vcs_info
  local indicator=$(my_git_info_stash)$vcs_info_msg_1_$(my_git_info_push)
  if [ "$indicator" != "" ]; then
    indicator=$indicator" "
  fi
  echo $indicator
}

hash_revision_vcs_info () {
  vcs_info
  if [ "$vcs_info_msg_2_" = "" ]; then
    return 0
  fi
  local short=$vcs_info_msg_2_
  short=${short:0:7}
  echo "[%F{yellow}"$short"%f]"
}

RPROMPT='$(indicator_vcs_info)'
RPROMPT+='$(hash_revision_vcs_info)'

PROMPT='%F{blue}%~%f '
PROMPT+='$(left_vcs_info)'
PROMPT+='%(?,%F{cyan}$%f,%F{red}$%f) '

function _precmd_vcs_info () {
  LANG=en_US.UTF-8 vcs_info
}
add-zsh-hook precmd _precmd_vcs_info

## prompt setting end


# PATH settings

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# platex
export PATH="$PATH:/usr/texbin"
# refer: /etc/paths.d/TeX

## These settings add to PATH
# rbenv settings
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv settings
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#alias brew="env PATH=${PATH/\/Users\/shunsuke\/\.pyenv\/shims:/} brew"

# Android SDK
# export PATH="$PATH:/Users/shunsuke/Library/Android/sdk/platform-tools"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# for tmux
export TERM=xterm-256color

alias gww='g++ -std=c++14 -O2 -Wall -Wextra'
#alias clang='clang -std=c11 -O2 -Wall'
alias clangww='clang++ -std=c++14 -O2 -Wall -Wextra'
alias clang++_atcoder='clang++ -I/usr/local/include/c++/v1 -L/usr/local/lib -I/opt/local/include/boost -L/opt/local/lib -std=c++14 -stdlib=libc++ -O2 -Wall -Wextra'
alias xx='clang++ -std=c++14 -O2 -Wall -Wextra -o x' # example
alias info='info --vi-keys'
alias cd..='cd ..'
alias diff=colordiff
alias rm=rmtrash
# ls aliases
alias ls='ls'
alias ls='ls -hFG'
alias la='ls -hFG -lA -T'
alias lt='ls -hFG -lAT'

# suffix alias
alias -s rb='ruby'
alias -s {cpp,cc}='runcc'

function runcc() {
  clang++ $1
  shift
  ./a.out $@
}

# Omission of cd & ls
setopt auto_cd
function chpwd() { ls }

function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}

# Ctrl+R -> peco
zle -N peco-history-selection
bindkey '^R' peco-history-selection

