-- =============================================================================
-- COLORSCHEME — Catppuccin Mocha
-- Matches tmux theme palette exactly.
-- =============================================================================

vim.pack.add({
  "https://github.com/catppuccin/nvim",
})

require("catppuccin").setup({
  flavour = "mocha",
  integrations = {
    telescope  = { enabled = true },
    nvim_tree  = true,
    gitsigns   = true,
    diffview   = true,
    treesitter = true,
    native_lsp = {
      enabled = true,
      underlines = {
        errors   = { "undercurl" },
        warnings = { "undercurl" },
      },
    },
  },
})

vim.cmd.colorscheme("catppuccin")
