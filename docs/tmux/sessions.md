# Sessions

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
