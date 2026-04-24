# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# Aliases
alias k='kubectl'

# Prompt
PS1='%n@%m %~ %# '

# Version checks
[[ -f "$ZDOTDIR/check_versions.sh" ]] && source "$ZDOTDIR/check_versions.sh"

# Local overrides and secrets (not committed)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# tmux: attach to existing session or create new one
if [ -z "$TMUX" ]; then
  tmux-sessionizer
fi
