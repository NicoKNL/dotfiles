-- =============================================================================
-- WHICH-KEY — shows keybinding hints after pressing a prefix key
-- =============================================================================
-- Pressing <leader> (or any prefix) shows a popup of available continuations.

vim.pack.add({
  "https://github.com/folke/which-key.nvim",
})

local ok, wk = pcall(require, "which-key")
if not ok then return end

wk.setup({
  delay = 300, -- ms before popup appears
})
