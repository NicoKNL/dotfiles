#!/usr/bin/env bash
# Bootstrap a machine: system packages → mise tools → symlinks → nvim plugins.
# Safe to re-run. Supports macOS (brew), Debian/Ubuntu (apt), RHEL/Fedora (dnf).
#
#   ./setup.sh              full bootstrap
#   ./setup.sh --no-system  skip system packages (no sudo, e.g. locked-down work box)
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKIP_SYSTEM=false
[[ "${1:-}" == "--no-system" ]] && SKIP_SYSTEM=true

log() { printf '\033[1;35m==>\033[0m %s\n' "$*"; }
SUDO=""; [[ $EUID -ne 0 ]] && SUDO="sudo"

# --- 1. System packages (things mise doesn't handle well) ----------------------
install_system() {
  case "$(uname -s)" in
    Darwin)
      xcode-select -p &>/dev/null || xcode-select --install
      command -v brew &>/dev/null || { echo "Install Homebrew first: https://brew.sh"; exit 1; }
      brew install tmux
      brew install --cask alacritty font-meslo-lg-nerd-font
      ;;
    Linux)
      if command -v apt-get &>/dev/null; then
        $SUDO apt-get update
        $SUDO apt-get install -y zsh tmux git curl unzip fontconfig build-essential \
          wl-clipboard xclip
        # GUI terminal only where there's a desktop
        [[ -n "${WAYLAND_DISPLAY:-}${DISPLAY:-}" ]] && $SUDO apt-get install -y alacritty
      elif command -v dnf &>/dev/null; then
        $SUDO dnf install -y zsh tmux git curl unzip fontconfig gcc gcc-c++ make \
          wl-clipboard xclip || true   # xclip/wl-clipboard may need EPEL
      else
        echo "Unsupported package manager — install zsh, tmux, gcc, make manually."
      fi
      install_font_linux
      ;;
  esac
}

install_font_linux() {
  local dir="$HOME/.local/share/fonts/MesloLGS-NF"
  [[ -d "$dir" ]] && return
  command -v fc-cache &>/dev/null || return 0
  log "Installing MesloLGS Nerd Font"
  local tmp; tmp="$(mktemp -d)"
  curl -fsSL -o "$tmp/Meslo.zip" \
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip
  mkdir -p "$dir"
  unzip -oq "$tmp/Meslo.zip" 'MesloLGSNerdFont-*.ttf' -d "$dir"
  rm -rf "$tmp"
  fc-cache -f "$dir"
}

if $SKIP_SYSTEM; then
  log "Skipping system packages"
else
  log "Installing system packages"
  install_system
fi

# --- 2. Symlinks (before mise so it picks up ~/.config/mise/config.toml) -------
log "Linking dotfiles"
python3 "$DOTFILES/dot.py"

# --- 3. mise + tools ---------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"
if ! command -v mise &>/dev/null; then
  log "Installing mise"
  curl -fsSL https://mise.run | sh
fi
log "Installing tools via mise"
mise install
export PATH="$HOME/.local/share/mise/shims:$PATH"   # shims: reliable in scripts

# --- 4. Neovim plugins -------------------------------------------------------
log "Installing/updating Neovim plugins"
nvim --headless +"lua vim.pack.update(nil, { force = true })" +qa || true

# --- 5. Default shell --------------------------------------------------------
zsh_path="$(command -v zsh || true)"
if [[ -n "$zsh_path" && "${SHELL:-}" != "$zsh_path" ]]; then
  log "Changing login shell to $zsh_path (may prompt for password)"
  chsh -s "$zsh_path" || echo "chsh failed — run manually: chsh -s $zsh_path"
fi

log "Done. Open a new terminal (log out/in for the shell change)."
