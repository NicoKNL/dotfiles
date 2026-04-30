# nvim

Config lives in `nvim/init.lua` (entry point) + `nvim/lua/keymaps.lua` (keymaps) + `nvim/lua/plugins/` (per-plugin modules), symlinked to `~/.config/nvim/`.

Uses the built-in `vim.pack` package manager (requires Neovim ≥ 0.11). No external plugin manager.

## File structure

```
nvim/
├── init.lua              # options, loads keymaps + plugins
├── nvim-pack-lock.json   # pinned plugin revisions
└── lua/
    ├── keymaps.lua       # global keymaps
    └── plugins/
        ├── colorscheme.lua # Catppuccin Mocha
        ├── git.lua         # gitsigns (inline hunks) + diffview (diff panel)
        ├── harpoon.lua     # harpoon2 — fast file navigation
        ├── lsp.lua         # language server (go-to-def, hover, diagnostics)
        ├── neogit.lua      # git UI (floating window)
        ├── neotest.lua     # test runner (pytest via uv)
        ├── noice.lua       # floating cmdline, messages, notifications
        ├── nvim-tree.lua   # file explorer sidebar
        ├── statusline.lua  # lualine statusline
        ├── telescope.lua   # fuzzy finder
        └── treesitter.lua  # syntax highlighting + folding
```
