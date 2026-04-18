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

vim.g.mapleader = " "           -- Space as leader key

local map = vim.keymap.set

-- Clear search highlights with Escape
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Window navigation (Ctrl + hjkl)
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- =============================================================================
-- PLUGINS (vim.pack — built-in, requires Neovim 0.11+)
-- =============================================================================

-- Add plugins with: vim.pack.add("https://github.com/author/plugin.git")
-- Packages are stored in ~/.local/share/nvim/site/pack/
