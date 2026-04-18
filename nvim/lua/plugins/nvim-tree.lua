-- =============================================================================
-- NVIM-TREE — file explorer sidebar
-- =============================================================================
-- Keymaps:
--   <leader>e   toggle file tree
--   <leader>E   focus file tree (open + jump to it)
--
-- Inside the tree:
--   o / <CR>    open file
--   <C-v>       open in vertical split
--   <C-x>       open in horizontal split
--   s           system open (macOS: opens in default app)
--   a           create file/dir (trailing / = dir)
--   d           delete
--   r           rename
--   y           copy name, Y = copy path
--   c / x / p   copy / cut / paste
--   H           toggle hidden files
--   R           refresh tree
--   ?           help

vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-tree/nvim-tree.lua",
})

-- Disable netrw (nvim-tree replaces it)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then return end

nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 32,
  },
  renderer = {
    group_empty = true,       -- collapse empty dirs into one line
    highlight_git = true,
    icons = {
      show = {
        git = true,
        file = true,
        folder = true,
        folder_arrow = true,
      },
    },
  },
  filters = {
    dotfiles = false,         -- show dotfiles by default (toggle with H)
    custom = { "^.git$" },   -- always hide .git dir
  },
  git = {
    enable = true,
    ignore = false,           -- show git-ignored files (dimmed)
  },
  actions = {
    open_file = {
      quit_on_open = true,    -- close tree after opening a file
    },
  },
})

local map = vim.keymap.set
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>",  { desc = "Toggle file tree" })
map("n", "<leader>E", "<cmd>NvimTreeFocus<CR>",   { desc = "Focus file tree" })
