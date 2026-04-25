-- =============================================================================
-- OPTIONS
-- =============================================================================

vim.opt.number = true           -- show line numbers
vim.opt.relativenumber = true   -- relative line numbers (great for jumping)
vim.opt.tabstop = 2             -- 2-space tabs
vim.opt.shiftwidth = 2          -- indent by 2
vim.opt.expandtab = true        -- spaces, not tabs
vim.opt.smartindent = true      -- auto-indent on new lines
vim.opt.wrap = false            -- don't wrap long lines
vim.opt.swapfile = false        -- no swap files
vim.opt.backup = false          -- no backup files
vim.opt.undofile = true         -- persistent undo (survives restarts)
vim.opt.hlsearch = true         -- highlight search results
vim.opt.incsearch = true        -- highlight while typing search
vim.opt.ignorecase = true       -- case-insensitive search...
vim.opt.smartcase = true        -- ...unless you type uppercase
vim.opt.termguicolors = true    -- true color in terminal
vim.opt.scrolloff = 8           -- keep 8 lines visible above/below cursor
vim.opt.signcolumn = "yes"      -- always show sign column (no layout shift)
vim.opt.clipboard = "unnamedplus" -- use system clipboard

-- =============================================================================
-- KEYMAPS
-- =============================================================================

require("keymaps")

-- =============================================================================
-- PLUGINS (vim.pack — built-in, requires Neovim 0.11+)
-- =============================================================================
-- Plugin configs live in lua/plugins/. Each file calls vim.pack.add() and
-- then configures the plugin. Packages stored in:
--   ~/.local/share/nvim/site/pack/

require("plugins.telescope")   -- fuzzy finder: files, grep, buffers, symbols
require("plugins.lsp")         -- LSP: go-to-definition, hover, diagnostics
require("plugins.nvim-tree")   -- file explorer sidebar
require("plugins.git")         -- gitsigns (inline hunks) + diffview (diff panel)
