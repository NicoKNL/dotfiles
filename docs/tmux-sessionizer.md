# tmux-sessionizer

A script that lets you fuzzy-find directories and jump to (or create) a tmux session rooted there. Activated on every new shell — if you're not already inside tmux it picks or creates a session automatically.

## Usage

```bash
tmux-sessionizer [OPTIONS] [SEARCH_PATH]
```

With no arguments, opens an fzf picker showing current directory, active tmux sessions, and all directories found under `TS_SEARCH_PATHS`.

| Option | Description |
|--------|-------------|
| `[SEARCH_PATH]` | Skip fzf and go directly to a specific path |
| `-s, --session <index>` | Run a `TS_SESSION_COMMANDS` entry (see below) |
| `--vsplit` | Open session command in a vertical split (use with `-s`) |
| `--hsplit` | Open session command in a horizontal split (use with `-s`) |
| `-v, --version` | Print version |
| `-h, --help` | Print help |

## Config file

Located at `~/.config/tmux-sessionizer/tmux-sessionizer.conf` (symlinked from `config/tmux-sessionizer.conf`).

### `TS_SEARCH_PATHS`

Array of directories to search for projects. Overrides the built-in default.

```bash
TS_SEARCH_PATHS=(~/Developer ~/work)
```

Append `:depth` to a path to control how deep the search goes for that entry:

```bash
TS_SEARCH_PATHS=(~/Developer ~/ghq:3)
```

Default max depth is `1` unless overridden by `TS_MAX_DEPTH`.

### `TS_EXTRA_SEARCH_PATHS`

Add paths on top of `TS_SEARCH_PATHS` without replacing them.

```bash
TS_EXTRA_SEARCH_PATHS=(~/side-projects:2 ~/.config:2)
```

### `TS_MAX_DEPTH`

Default search depth for entries that don't specify their own. Default: `1`.

```bash
TS_MAX_DEPTH=2
```

### `TS_SESSION_COMMANDS`

List of shell commands accessible via `-s <index>`. Useful for opening tools in dedicated windows or panes without breaking your current workflow. Commands are placed in high-numbered windows (index 69+) so they don't interfere with regular windows.

```bash
TS_SESSION_COMMANDS=("lazygit" "btop")
```

Usage:

```bash
tmux-sessionizer -s 0           # open lazygit in a new window
tmux-sessionizer -s 0 --vsplit  # open lazygit in a vertical split pane
tmux-sessionizer -s 1 --hsplit  # open btop in a horizontal split pane
```

Split panes are cached — re-running the same command will focus the existing pane rather than opening a new one.

### `TS_LOG` / `TS_LOG_FILE`

Enable debug logging.

```bash
TS_LOG=file                  # write logs to TS_LOG_FILE
TS_LOG=echo                  # print logs to stdout
TS_LOG_FILE=~/my-ts.log      # custom log path (default: ~/.local/share/tmux-sessionizer/tmux-sessionizer.logs)
```

## Session hydration

When a new session is created, the script looks for a `.tmux-sessionizer` file to source:

1. `<project-dir>/.tmux-sessionizer` — project-local setup (runs windows, starts servers, etc.)
2. `~/.tmux-sessionizer` — global fallback

Hydration is skipped when using `-s`/`--session`.

## Example config

```bash
# ~/.config/tmux-sessionizer/tmux-sessionizer.conf

TS_SEARCH_PATHS=(~/Developer)
TS_EXTRA_SEARCH_PATHS=(~/.config:2)
TS_MAX_DEPTH=1
TS_SESSION_COMMANDS=("lazygit" "btop")
```
