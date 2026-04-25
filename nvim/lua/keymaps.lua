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

-- Reload config
map("n", "<leader>rv", "<cmd>source $MYVIMRC<CR>", { desc = "Reload config" })
