# AGENTS.md

## Deploy

```sh
python3 dot.py            # interactive (prompts on conflicts)
python3 dot.py --dry-run  # preview only
python3 dot.py --force    # overwrite without prompting
```

`--dry-run` and `--force` are mutually exclusive.

## Adding a new dotfile

1. Place file/dir in appropriate subdir (or create one).
2. Add entry to `dotmap.json` under `"link"`: `"source/rel/path": "~/target/path"`.

That's it. `dot.py` creates parent dirs and backs up conflicts as `.bak` (`.bak1`, `.bak2`, ...).

## Symlink map (source → target)

| Source | Target |
|--------|--------|
| `zsh/.zshenv` | `~/.zshenv` |
| `zsh/` | `~/.config/zsh/` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |
| `alacritty/alacritty.toml` | `~/.config/alacritty/alacritty.toml` |
| `nvim/` | `~/.config/nvim/` |
| `scripts/tmux-sessionizer` | `~/.local/bin/tmux-sessionizer` |
| `config/tmux-sessionizer.conf` | `~/.config/tmux-sessionizer/tmux-sessionizer.conf` |
| `starship/starship.toml` | `~/.config/starship.toml` |

## Docs site

Built with `zensical`. Config in `zensical.toml`. Source in `docs/`. Built output in `site/` (committed).

```sh
pip install zensical
zensical build --clean
```

CI auto-deploys to GitHub Pages on push to `main`/`master`.

## Version requirements

Tracked in `zsh/check_versions.sh` (sourced by shell):
- nvim ≥ 0.12.1
- tmux ≥ 3.4

## No test suite, no linter

No test, lint, typecheck, or build step beyond `zensical build` for docs.

## Neovim plugin conventions

Plugin manager: **`vim.pack` (built-in, Neovim 0.11+)**. No lazy.nvim, packer, or vim-plug.

### Adding plugins

`vim.pack.add` takes a **list table of full GitHub HTTPS URLs** — not short `owner/repo` strings:

```lua
vim.pack.add({
  "https://github.com/owner/plugin-name",
  "https://github.com/owner/other-plugin",
})
```

Single-plugin shorthand (`vim.pack.add("owner/repo")`) is **invalid** and will error.

### Plugin config files

One file per logical group in `nvim/lua/plugins/`. Each file:
1. Calls `vim.pack.add({...})` with full URLs
2. Calls `require("plugin").setup({...})`
3. Registers keymaps via `vim.keymap.set`

Then `require("plugins.filename")` added to `nvim/init.lua`.

### Lock file

`nvim/nvim-pack-lock.json` pins installed revs. After installing, capture with:

```sh
git -C ~/.local/share/nvim/site/pack/core/opt/<plugin-name> rev-parse HEAD
```

Pack path is `~/.local/share/nvim/site/pack/core/opt/<plugin-name>`.

### Install / update

```sh
nvim --headless +"lua vim.pack.update()" +qa
```
