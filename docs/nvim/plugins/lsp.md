# LSP

Language server support via Neovim's **built-in** `vim.lsp.config` (0.11+) — no plugin required.

Active when an LSP-supported file is open (`.py`, `.ts`, `.js`, etc.).

## Keymaps

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

## Language Servers

Must be installed on the system:

| Language | Server | Install |
|----------|--------|---------|
| Python | `pyright` | `npm install -g pyright` |
| TypeScript / JavaScript | `ts_ls` | `npm install -g typescript typescript-language-server` |
