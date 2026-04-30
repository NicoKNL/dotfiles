# zsh

## File layout

| File | Target | Purpose |
|------|--------|---------|
| `zsh/.zshenv` | `~/.zshenv` | Sets `ZDOTDIR` — loaded by every zsh process before anything else |
| `zsh/` | `~/.config/zsh/` | All other zsh config (`.zshrc`, `check_versions.sh`, history, compdump) |

### Why `.zshenv` exists

zsh normally reads `~/.zshrc`. Setting `ZDOTDIR` in `~/.zshenv` redirects all config to `~/.config/zsh/`, keeping `$HOME` clean. This file must live at `~/.zshenv` (not inside `ZDOTDIR`) since zsh loads it before `ZDOTDIR` is known.

## `.zshrc`

Key sections:

**PATH** — Homebrew, nvim, Python 3.9 user bin, `~/.local/bin`, Node 22.

**XDG** — `XDG_CONFIG_HOME` set to `~/.config`.

**NVM** — Node version manager sourced if present.

**bun** — bun runtime sourced if present.

**Aliases**

| Alias | Expands to |
|-------|-----------|
| `k` | `kubectl` |

**Prompt** — [starship](https://starship.rs/) with Catppuccin Mocha palette. Powerline segments: OS icon → username → directory → git branch/status → language versions → conda → time → command duration. Config at `starship/starship.toml`, symlinked to `~/.config/starship.toml`. Requires `starship` on `PATH` (`brew install starship`).

**Version checks** — sources `check_versions.sh` on every interactive shell start (see below).

**Local overrides** — `~/.zshrc.local` is sourced if it exists. Use this for machine-specific settings and secrets (not committed).

**Auto-attach tmux** — if not already inside a tmux session, `tmux-sessionizer` is called automatically, landing you in a session immediately.

## Version checks (`check_versions.sh`)

Sourced by `.zshrc` on every interactive shell start. Warns if installed tools are below the required minimum:

| Tool | Minimum |
|------|---------|
| nvim | 0.12.1 |
| tmux | 3.4 |

Example warning:

```
[warn] nvim 0.11.0 < required 0.12.1 — run: brew upgrade neovim
```

To add a new tool check, follow the existing pattern in `zsh/check_versions.sh`.
