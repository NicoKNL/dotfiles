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
