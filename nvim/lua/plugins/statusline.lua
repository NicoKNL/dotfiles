-- =============================================================================
-- STATUSLINE — lualine.nvim
-- =============================================================================

vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
  options = {
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    globalstatus = true, -- single statusline across all windows
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } }, -- relative path
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "location" },
  },
})
