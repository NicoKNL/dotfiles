# PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/Applications/nvim/bin:$PATH
export PATH=/Users/nico/Library/Python/3.9/bin:$PATH
export PATH="$PATH:/Users/nico/.local/bin"
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"

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
