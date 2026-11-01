export ZDOTDIR="$HOME/.config/zsh"

# PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"

# True color
export COLORTERM=truecolor

# Local overrides and secrets (not committed)
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
