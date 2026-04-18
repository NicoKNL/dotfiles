# tmux cheatsheet

PREFIX = `C-Space`

## Sessions

| Key / Command | Action |
|---|---|
| `C-Space f` | **sessionizer** — fuzzy-pick a project dir, create/switch session |
| `C-Space s` | list & switch sessions (interactive tree) |
| `C-Space d` | detach (session keeps running in background) |
| `C-Space (` / `)` | previous / next session |
| `tmux new -s <name>` | create named session from shell |
| `tmux attach -t <name>` | attach to session by name |
| `tmux ls` | list sessions from shell |

> **Sessionizer** (`C-Space f`) searches `~/Developer` and `~/personal` (depth 1) using `fzf`.
> Requires `fzf` (`brew install fzf`) and `~/.local/bin` in `PATH`.
> Pass a path directly to skip the picker: `tmux-sessionizer ~/Developer/myproject`

## Windows

| Key | Action |
|---|---|
| `C-Space c` | new window |
| `C-Space ,` | rename window |
| `C-Space w` | list & switch windows (interactive tree) |
| `C-Space n` / `p` | next / previous window |
| `C-Space <number>` | jump to window by number |
| `C-Space &` | kill window |

## Panes

| Key | Action |
|---|---|
| `C-Space \|` | split vertical (new pane right) |
| `C-Space -` | split horizontal (new pane below) |
| `C-Space h/j/k/l` | navigate panes (vim-style) |
| `C-Space H/J/K/L` | resize pane (repeatable) |
| `C-Space z` | zoom pane (toggle fullscreen) |
| `C-Space x` | kill pane |
| `C-Space q` | show pane numbers (type number to jump) |
| `C-Space {` / `}` | swap pane with previous / next |

## Copy mode

| Key | Action |
|---|---|
| `C-Space [` | enter copy mode |
| `q` / `Escape` | exit copy mode |
| `h/j/k/l` | move cursor |
| `/` | search forward (`n` = next match) |
| `v` | begin selection |
| `y` | yank selection & exit copy mode |
| `C-Space ]` | paste |

## Misc

| Key | Action |
|---|---|
| `C-Space r` | reload config |
| `C-Space ?` | list all keybindings |
| `C-Space :` | command prompt (e.g. `:new-session`, `:kill-session`) |
