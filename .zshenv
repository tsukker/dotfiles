# Remove '#' in the next line for profiling zsh init.

#zmodload zsh/zprof && zprof

# MANPATH settings

export MANPATH="/usr/local/man:$MANPATH"

# History settings
# History file
export HISTFILE=~/.zsh_history
# History size in memory
export HISTSIZE=10000000
# The number of histsize
export SAVEHIST=10000000
# Change history view
HIST_STAMPS="yyyy-mm-dd"
# Do not save if the same one is already in history file
setopt hist_ignore_dups
# Share history with other zsh
setopt share_history
# Erase unnecessary blanks
setopt hist_reduce_blanks
# Do not save "history" command
setopt hist_no_store
# Expand history automatically at completion
setopt hist_expand
# Save start and finish
setopt EXTENDED_HISTORY

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

zshaddhistory() {
  local line=${1%%$'\n'}
  local cmd=${line%% *}

  # 以下の条件をすべて満たすものだけをヒストリに追加する
  [[ ${cmd} != (pwd)
  && ${cmd} != (history)
  ]]
}
