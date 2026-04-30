# Keymaps

Leader key: `Space`

## General

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<Esc>` | Clear search highlights |
| Normal | `<C-h/j/k/l>` | Navigate windows |
| Normal | `<C-d>` / `<C-u>` | Scroll half-page, cursor centered |
| Visual | `J` / `K` | Move selected lines down / up |
| Normal | `<leader>rv` | Reload config (`$MYVIMRC`) |

## File explorer (nvim-tree)

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>e` | Toggle file tree |
| Normal | `<leader>E` | Focus file tree |

**Inside the tree:**

| Key | Action |
|-----|--------|
| `o` / `<CR>` | Open file |
| `<C-v>` | Open in vertical split |
| `<C-x>` | Open in horizontal split |
| `s` | System open (macOS default app) |
| `a` | Create file/dir (trailing `/` = dir) |
| `d` | Delete |
| `r` | Rename |
| `y` / `Y` | Copy name / copy path |
| `c` / `x` / `p` | Copy / cut / paste |
| `H` | Toggle hidden files |
| `R` | Refresh tree |
| `?` | Help |

## Telescope (fuzzy finder)

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>ff` | Find files (including hidden/dotfiles) |
| Normal | `<leader>fg` | Live grep (requires ripgrep) |
| Normal | `<leader>fb` | Git branches (checkout / create) |
| Normal | `<leader>fs` | LSP document symbols |
| Normal | `<leader>fr` | Recently opened files |
| Normal | `<leader>fh` | Help tags |

## LSP (active when LSP attaches to buffer)

| Mode | Key | Action |
|------|-----|--------|
| Normal | `gd` | Go to definition |
| Normal | `gD` | Go to declaration |
| Normal | `gr` | Go to references |
| Normal | `gi` | Go to implementation |
| Normal | `K` | Hover documentation |
| Normal | `<leader>rn` | Rename symbol |
| Normal | `<leader>ca` | Code actions |
| Normal | `[d` / `]d` | Previous / next diagnostic |
| Normal | `<leader>d` | Show diagnostics for current line |

## Git (gitsigns + diffview)

| Mode | Key | Action |
|------|-----|--------|
| Normal | `]g` | Next hunk |
| Normal | `[g` | Previous hunk |
| Normal | `<leader>gs` | Stage hunk |
| Normal | `<leader>gr` | Reset hunk |
| Visual | `<leader>gs` | Stage hunk (visual selection) |
| Visual | `<leader>gr` | Reset hunk (visual selection) |
| Normal | `<leader>gp` | Preview hunk inline |
| Normal | `<leader>gb` | Blame line |
| Normal | `<leader>gd` | Open diffview panel (all changed files) |
| Normal | `<leader>gD` | Close diffview panel |
| Normal | `<leader>gh` | File history (current file) |
| Normal | `<leader>gH` | Repo-wide git history |

## Neogit

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>gg` | Open Neogit (floating window) |

## Harpoon 2

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>ha` | Add current file to harpoon list |
| Normal | `<leader>hh` | Toggle quick menu |
| Normal | `[h` | Previous in harpoon list |
| Normal | `]h` | Next in harpoon list |
| Normal | `<leader>1`–`<leader>9` | Jump to harpoon slot 1–9 |

## Neotest

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>tn` | Run nearest test |
| Normal | `<leader>tf` | Run current file |
| Normal | `<leader>ts` | Run full suite |
| Normal | `<leader>tl` | Re-run last test |
| Normal | `<leader>tx` | Stop running test |
| Normal | `<leader>to` | Open test output |
| Normal | `<leader>tS` | Toggle test summary panel |
| Normal | `<leader>tp` | Toggle output panel |
| Normal | `]t` | Next failed test |
| Normal | `[t` | Previous failed test |
