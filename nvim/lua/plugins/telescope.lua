-- =============================================================================
-- TELESCOPE — fuzzy finder for files, grep, buffers, LSP symbols
-- =============================================================================
-- Deps: plenary.nvim, telescope-fzf-native.nvim (requires `make` on first install)
-- Keymaps:
--   <leader>ff  find files (including hidden/dotfiles)
--   <leader>fg  live grep (requires ripgrep)
--   <leader>fb  open buffers
--   <leader>fs  LSP document symbols
--   <leader>fr  recently opened files

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
})

local ok, telescope = pcall(require, "telescope")
if not ok then return end

local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.55 },
    file_ignore_patterns = { "node_modules", ".git/", "__pycache__", "%.pyc" },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

-- Load fzf native extension for faster sorting (built from C)
pcall(telescope.load_extension, "fzf")

local map = vim.keymap.set

map("n", "<leader>ff", function() builtin.find_files({ hidden = true }) end, { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep,            { desc = "Live grep" })
map("n", "<leader>fb", builtin.buffers,              { desc = "Find buffers" })
map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
map("n", "<leader>fr", builtin.oldfiles,             { desc = "Recent files" })
map("n", "<leader>fh", builtin.help_tags,            { desc = "Help tags" })
