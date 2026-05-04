-- =============================================================================
-- TELESCOPE — fuzzy finder for files, grep, buffers, LSP symbols
-- =============================================================================
-- Deps: plenary.nvim, telescope-fzf-native.nvim (requires `make` on first install)
-- Keymaps:
--   <leader>ff  find files (including hidden/dotfiles)
--   <leader>fg  live grep (requires ripgrep)
--   <leader>fb  git branches (checkout/create)
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
map("n", "<leader>fg", function() builtin.live_grep({ additional_args = { "--hidden" } }) end, { desc = "Live grep" })
map("n", "<leader>fb", function()
  builtin.git_branches({
    attach_mappings = function(prompt_bufnr, _)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if entry.value:match("^origin/") then
          -- create local tracking branch instead of detached HEAD
          vim.fn.system("git checkout --track " .. entry.value)
        else
          vim.fn.system("git checkout " .. entry.value)
        end
        vim.cmd("checktime")
      end)
      return true
    end,
  })
end, { desc = "Find branches" })
map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
map("n", "<leader>fr", builtin.oldfiles,             { desc = "Recent files" })
map("n", "<leader>fh", builtin.help_tags,            { desc = "Help tags" })
