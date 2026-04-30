-- =============================================================================
-- INDENT-BLANKLINE — dotted indent guides + whitespace rendering
-- =============================================================================
-- Inactive indent guides are dim grey.
-- The active scope line cycles through Catppuccin Mocha palette colors.
-- Whitespace chars show spaces (·), tabs (→), and trailing spaces (•).

vim.pack.add({
  "https://github.com/lukas-reineke/indent-blankline.nvim",
})

local ok, ibl = pcall(require, "ibl")
if not ok then return end

-- Catppuccin Mocha palette
local mocha = {
  rosewater = "#f5e0dc",
  flamingo  = "#f2cdcd",
  pink      = "#f5c2e7",
  mauve     = "#cba6f7",
  red       = "#f38ba8",
  peach     = "#fab387",
  yellow    = "#f9e2af",
  green     = "#a6e3a1",
  teal      = "#94e2d5",
  sky       = "#89dceb",
  sapphire  = "#74c7ec",
  blue      = "#89b4fa",
  lavender  = "#b4befe",
}

local rainbow = {
  "IBLRainbow1", "IBLRainbow2", "IBLRainbow3", "IBLRainbow4",
  "IBLRainbow5", "IBLRainbow6", "IBLRainbow7",
}

local colors = {
  mocha.mauve, mocha.blue, mocha.peach,
  mocha.green, mocha.pink, mocha.yellow, mocha.teal,
}

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  -- Dim grey for inactive guides
  vim.api.nvim_set_hl(0, "IBLIndent", { fg = "#313244" }) -- Mocha surface0
  -- Active scope colors
  for i, name in ipairs(rainbow) do
    vim.api.nvim_set_hl(0, name, { fg = colors[i] })
  end
end)

-- Show spaces (·), tabs (→ ), and trailing spaces (•)
vim.opt.list = true
vim.opt.listchars = {
  space    = "·",
  tab      = "→ ",
  trail    = "•",
}

ibl.setup({
  indent = {
    char      = "┊",
    highlight = "IBLIndent", -- dim grey when not in scope
  },
  scope = {
    enabled    = true,
    show_start = false,
    show_end   = false,
    highlight  = rainbow,   -- active scope cycles through Mocha colors
  },
  exclude = {
    filetypes = { "help", "NvimTree", "neo-tree", "dashboard", "lazy", "mason", "notify" },
    buftypes  = { "terminal", "nofile", "quickfix", "prompt" },
  },
})
