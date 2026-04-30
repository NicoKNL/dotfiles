# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# History
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# fzf — fuzzy history search (CTRL-R), file picker (CTRL-T), cd (ALT-C)
source <(fzf --zsh)
bindkey '^F' fzf-cd-widget  # CTRL-F: fuzzy cd (replaces ALT-C)

# Aliases
alias k='kubectl'

# Prompt
eval "$(starship init zsh)"

# Version checks
[[ -f "$ZDOTDIR/check_versions.sh" ]] && source "$ZDOTDIR/check_versions.sh"

# Local overrides and secrets (not committed)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# tmux: attach to existing session or create new one
if [[ -z "$TMUX" && -t 0 ]]; then
  tmux-sessionizer
fi
