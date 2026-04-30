# dotfiles

Symlink-based dotfiles manager for macOS. Configs are kept in this repo and deployed to their expected locations via symlinks using `dot.py`.

## Managed configs

| Source | Target |
|--------|--------|
| `zsh/.zshenv` | `~/.zshenv` |
| `zsh/` | `~/.config/zsh` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |
| `alacritty/alacritty.toml` | `~/.config/alacritty/alacritty.toml` |
| `nvim/` | `~/.config/nvim` |
| `scripts/tmux-sessionizer` | `~/.local/bin/tmux-sessionizer` |
| `config/tmux-sessionizer.conf` | `~/.config/tmux-sessionizer/tmux-sessionizer.conf` |
| `starship/starship.toml` | `~/.config/starship.toml` |

## Deploy

```bash
# interactive — prompts on conflicts
python3 dot.py

# preview changes without touching anything
python3 dot.py --dry-run

# overwrite all conflicts without prompting
python3 dot.py --force
```

## How it works

`dot.py` reads `dotmap.json` and creates symlinks from each source path (relative to the repo root) to the specified target path. Conflicts are handled gracefully:

- **Correct symlink already exists** → skipped
- **Wrong symlink** → prompts to relink (or forced)
- **Real file/directory** → backed up to `<path>.bak`, then replaced
- **Nothing there** → linked immediately

## dotmap.json

The mapping file declares all symlinks under the `link` key:

```json
{
  "link": {
    "source/path": "~/target/path"
  }
}
```

Add new entries here to include additional configs in the deploy.

## Adding a new dotfile

1. Place the file or directory in an appropriate subdirectory of this repo (create one if needed).
2. Add an entry to `dotmap.json` under the `"link"` key:

```json
{
  "link": {
    "source/rel/path": "~/target/path"
  }
}
```

3. Run `python3 dot.py` to deploy. Parent directories are created automatically; conflicts are backed up as `.bak` (`.bak1`, `.bak2`, … if a `.bak` already exists).

## References

- [tmux cheatsheet](tmux/index.md)
- [tmux-sessionizer](tmux-sessionizer.md)
- [zsh](zsh.md)
- [nvim](nvim/index.md)
- [alacritty](alacritty.md)

## Prerequisites

| Tool | Version | Install |
|------|---------|---------|
| `fzf` | any | `brew install fzf` — required by tmux-sessionizer |
| `nvim` | ≥ 0.12.1 | `brew install neovim` |
| `tmux` | ≥ 3.4 | `brew install tmux` |
