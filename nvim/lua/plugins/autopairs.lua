-- =============================================================================
-- NVIM-AUTOPAIRS — auto-close brackets, quotes, etc.
-- =============================================================================
-- Integrates with blink.cmp: accepting a completion won't double-insert pairs.

vim.pack.add({
  "https://github.com/windwp/nvim-autopairs",
})

local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then return end

autopairs.setup({
  check_ts = true,  -- use treesitter to avoid inserting pairs inside strings/comments
})
