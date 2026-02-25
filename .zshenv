# Remove '#' in the next line for profiling zsh init.

#zmodload zsh/zprof && zprof

. "$HOME/.cargo/env"

# MANPATH settings

export MANPATH="/usr/local/man:$MANPATH"

# PATH settings
# 非インタラクティブシェルでは zshrc は読み込まれないので、PATH は zshenv で設定する

# Added by homebrew
export PATH="/usr/local/sbin:$PATH"
# Homebrew path for macOS Big Sur or newer
export PATH="/opt/homebrew/bin:$PATH"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# platex
export PATH="$PATH:/usr/texbin"
# refer: /etc/paths.d/TeX

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# anyenv
if command -v anyenv 1>/dev/null 2>&1; then
  eval "$(anyenv init -)"
fi

# ↑ goenv だけなぜか PATH の最後尾に設定されるので明示的に前に付ける
export PATH="$GOENV_ROOT/shims:$PATH"

# Golang
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
