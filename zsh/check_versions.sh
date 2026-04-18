# =============================================================================
# VERSION CHECKS
# Warns if installed tools fall below minimum required versions.
# To add a tool: follow the pattern below.
# =============================================================================

# --- Minimum versions ---
_NVIM_MIN="0.12.1"
_TMUX_MIN="3.4"

# --- Semver comparison: returns 0 if $1 >= $2 ---
_version_gte() {
  printf '%s\n%s\n' "$2" "$1" | sort -V -C
}

# --- nvim ---
if command -v nvim &>/dev/null; then
  _nvim_ver=$(nvim --version 2>/dev/null | head -1 | sed 's/NVIM v//')
  if ! _version_gte "$_nvim_ver" "$_NVIM_MIN"; then
    echo "[warn] nvim $_nvim_ver < required $_NVIM_MIN — run: brew upgrade neovim"
  fi
fi

# --- tmux ---
if command -v tmux &>/dev/null; then
  _tmux_ver=$(tmux -V 2>/dev/null | sed 's/tmux //')
  if ! _version_gte "$_tmux_ver" "$_TMUX_MIN"; then
    echo "[warn] tmux $_tmux_ver < required $_TMUX_MIN — run: brew upgrade tmux"
  fi
fi

# --- Cleanup ---
unset -f _version_gte
unset _nvim_ver _tmux_ver
