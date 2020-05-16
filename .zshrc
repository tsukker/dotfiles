# If you use zplug as plugin manager, it is unnecessary to call compinit explicitly.
# See https://qiita.com/vintersnow/items/7343b9bf60ea468a4180#compinit
autoload -U compinit && compinit

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin \
                             /usr/local/git/bin
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

# Added by homebrew
export PATH="/usr/local/sbin:$PATH"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# platex
export PATH="$PATH:/usr/texbin"
# refer: /etc/paths.d/TeX


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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shunsuke/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shunsuke/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shunsuke/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shunsuke/google-cloud-sdk/completion.zsh.inc'; fi

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# anyenv
if command -v anyenv 1>/dev/null 2>&1; then
  eval "$(anyenv init -)"
fi

export PATH="$HOME/.cargo/bin:$PATH"


#<< COMMENTOUT
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

#zinit ice proto'git' pick'init.sh'; zinit light b4b4r07/enhancd  # See below

zinit ice from"gh-r" as"program"; zinit load junegunn/fzf-bin
#zinit ice from"gh-r" as"program"; zinit load peco/peco  # Temporarily disabled because peco can be installed by Homebrew

zinit wait"0" lucid light-mode for\
    b4b4r07/enhancd \
    zsh-users/zsh-completions \
    zsh-users/zsh-history-substring-search \
    zdharma/fast-syntax-highlighting \

# End of zinit plugins
#COMMENTOUT


# Alias settings

alias gww='g++ -std=c++14 -O2 -Wall -Wextra'
#alias clang='clang -std=c11 -O2 -Wall'
alias clangww='clang++ -std=c++14 -O2 -Wall -Wextra'
alias clang++_atcoder='clang++ -I/usr/local/include/c++/v1 -L/usr/local/lib -I/opt/local/include/boost -L/opt/local/lib -std=c++14 -stdlib=libc++ -O2 -Wall -Wextra'
alias xx='clang++ -std=c++14 -O2 -Wall -Wextra -o x' # example
alias info='info --vi-keys'
alias cd..='cd ..'
alias diff=colordiff
#alias rm=rmtrash
# ls aliases
alias ls='ls'
alias ls='ls -hFG'
alias la='ls -hFG -lA -T'
alias lt='ls -hFG -lAT'
# ghq
alias ghqlk='cd $(ghq root)/$(ghq list | fzf)'

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

function fzf-history-selection() {
  BUFFER=$(history -n 1 | tail -r | awk '!a[$0]++' | fzf --query "$LBUFFER" | sed 's/\\n/\n/')
  CURSOR=$#BUFFER
  zle reset-prompt
}

# Ctrl+R -> peco
zle -N peco-history-selection
zle -N fzf-history-selection
#bindkey '^r' peco-history-selection
bindkey '^r' fzf-history-selection


# Profiling (See the head of .zshenv)
if (which zprof > /dev/null) ;then
  zprof | less
fi
