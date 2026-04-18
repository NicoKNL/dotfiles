# nvim

Config lives in `nvim/init.lua` (entry point) + `nvim/lua/plugins/` (per-plugin modules), symlinked to `~/.config/nvim/`.

Uses the built-in `vim.pack` package manager (requires Neovim ≥ 0.11). No external plugin manager.

## File structure

```
nvim/
├── init.lua              # options, keymaps, loads lua/plugins/*
└── lua/
    └── plugins/
        ├── telescope.lua # fuzzy finder
        ├── lsp.lua       # language server (go-to-def, hover, diagnostics)
        └── nvim-tree.lua # file explorer sidebar
```
