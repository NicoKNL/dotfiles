# nvim

Config lives in `nvim/init.lua` (entry point) + `nvim/lua/plugins/` (per-plugin modules), symlinked to `~/.config/nvim/`.

Uses the built-in `vim.pack` package manager (requires Neovim ≥ 0.11). No external plugin manager.

## File structures

```
nvim/
├── init.lua              # options, keymaps, loads lua/plugins/*
└── lua/
    └── plugins/
        ├── telescope.lua # fuzzy finder
        ├── lsp.lua       # language server (go-to-def, hover, diagnostics)
        └── nvim-tree.lua # file explorer sidebar
```

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

### Navigation

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<Esc>` | Clear search highlights |
| Normal | `<C-h/j/k/l>` | Navigate windows |
| Normal | `<C-d>` / `<C-u>` | Scroll half-page, cursor centered |
| Visual | `J` / `K` | Move selected lines down / up |

### Telescope (fuzzy finder)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files in project |
| `<leader>fg` | Live grep (search file contents) |
| `<leader>fb` | Open buffers |
| `<leader>fs` | LSP document symbols |
| `<leader>fr` | Recently opened files |
| `<leader>fh` | Help tags |

### LSP (language server)

Active when an LSP-supported file is open (`.py`, `.ts`, `.js`, etc.).

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>d` | Show diagnostics for current line |

### File tree (nvim-tree)

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file tree |
| `<leader>E` | Focus file tree |

Inside the tree:

| Key | Action |
|-----|--------|
| `o` / `<CR>` | Open file |
| `v` | Open in vertical split |
| `s` | Open in horizontal split |
| `a` | Create file/dir (trailing `/` = dir) |
| `d` | Delete |
| `r` | Rename |
| `c` / `x` / `p` | Copy / cut / paste |
| `H` | Toggle hidden files |
| `R` | Refresh tree |
| `?` | Show help |

## Plugins

| Plugin | Purpose |
|--------|---------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, grep, buffers |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | Native fzf sorter for Telescope |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility lib (Telescope dep) |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer sidebar |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File icons (nvim-tree dep) |

LSP uses Neovim's **built-in** `vim.lsp.config` (0.11+) — no plugin required.

## Language servers

Must be installed on the system (not vim plugins):

| Language | Server | Install |
|----------|--------|---------|
| Python | `pyright` | `npm install -g pyright` |
| TypeScript / JavaScript | `ts_ls` | `npm install -g typescript typescript-language-server` |

## Adding plugins

Create a new file in `lua/plugins/yourplugin.lua`:

```lua
vim.pack.add({ "https://github.com/author/plugin.git" })
local ok, plugin = pcall(require, "plugin-name")
if not ok then return end
plugin.setup({ ... })
```

Then add `require("plugins.yourplugin")` to `init.lua`.

Packages are stored in `~/.local/share/nvim/site/pack/`.
