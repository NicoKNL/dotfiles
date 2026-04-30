-- =============================================================================
-- TODO-COMMENTS — highlight and search TODO/FIXME/HACK/NOTE comments
-- =============================================================================
-- Keymaps:
--   ]t          jump to next TODO comment
--   [t          jump to prev TODO comment
--   <leader>ft  telescope picker for all TODO comments in project

vim.pack.add({
  "https://github.com/folke/todo-comments.nvim",
})

local ok, todo = pcall(require, "todo-comments")
if not ok then return end

todo.setup({})

local map = vim.keymap.set

map("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next TODO comment" })
map("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Prev TODO comment" })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find TODOs" })
