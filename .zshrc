## prompt settings

setopt prompt_subst
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:*" get-revision true # %i, git hash revision
zstyle ':vcs_info:*' max-exports 3
zstyle ":vcs_info:git:*" stagedstr "<S>" # %c
zstyle ":vcs_info:git:*" unstagedstr "<U>" # %u
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

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias g++='g++ -std=c++14 -O2 -Wall -Wextra'
alias prev='open -a Preview'
alias clang++='clang++ -std=c++14 -O2 -Wall -Wextra'
alias xx='clang++ -std=c++14 -O2 -Wall -Wextra -o x' # example
alias info='info --vi-keys'
alias cd..='cd ..'
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
  [[ ${cmd} != (l[sa])
  && ${cmd} != (man)
  && ${cmd} != (pwd)
  && ${cmd} != (which)
  && ${cmd} != (info)
  && ${cmd} != (clnag++)
  && ${cmd} != (history)
  ]]
}
