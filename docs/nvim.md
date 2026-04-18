# nvim

Config lives in `nvim/init.lua`, symlinked to `~/.config/nvim/`.

Uses the built-in `vim.pack` package manager (requires Neovim ≥ 0.11). No external plugin manager.

## Options

| Option | Value | Effect |
|--------|-------|--------|
| Line numbers | relative + absolute | Fast line jumping |
| Tabs | 2 spaces, expanded | Spaces, not tabs |
| Wrap | off | Long lines don't wrap |
| Swap/backup | off | No clutter files |
| Undo | persistent | Survives restarts |
| Search | case-insensitive, smart-case | Uppercase = case-sensitive |
| Scroll offset | 8 lines | Cursor stays near center |
| Sign column | always shown | No layout shift on diagnostics |
| Clipboard | system | Yank/paste uses OS clipboard |

## Keymaps

Leader key: `Space`

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<Esc>` | Clear search highlights |
| Normal | `<C-h/j/k/l>` | Navigate windows |
| Normal | `<C-d>` / `<C-u>` | Scroll half-page, cursor centered |
| Visual | `J` / `K` | Move selected lines down / up |

## Adding plugins

```lua
vim.pack.add("https://github.com/author/plugin.git")
```

Packages are stored in `~/.local/share/nvim/site/pack/`.
