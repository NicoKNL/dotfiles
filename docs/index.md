# dotfiles

Symlink-based dotfiles for macOS and Linux (Ubuntu, RHEL). Configs are kept in this repo and deployed to their expected locations via symlinks using `dot.py`.

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
| `mise/config.toml` | `~/.config/mise/config.toml` |

## New machine

```bash
./setup.sh              # system packages + mise tools + symlinks + nvim plugins
./setup.sh --no-system  # same, without sudo/system packages
```

System packages (zsh, tmux, C compiler, clipboard, alacritty, Nerd Font) come from brew / apt / dnf.
Everything else (nvim, node, uv, fzf, starship, ripgrep, tree-sitter, language servers) is pinned in
`mise/config.toml` and installed by [mise](https://mise.jdx.dev) into `$HOME` — no sudo.

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

Installed by `setup.sh`. Tool versions live in `mise/config.toml` (`mise install` / `mise upgrade`).

| Tool | Version | Source |
|------|---------|--------|
| `nvim` | ≥ 0.12.1 | mise |
| `fzf`, `starship`, `ripgrep`, `tree-sitter` | latest | mise |
| `node`, `uv`, LSPs | see `mise/config.toml` | mise |
| `tmux` | ≥ 3.4 | brew / apt / dnf |
| `zsh`, C compiler, `make` | any | brew / apt / dnf |
