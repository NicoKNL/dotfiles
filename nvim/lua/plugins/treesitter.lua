vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

-- Install Python parser
require("nvim-treesitter").install({ "python" })

-- Highlighting via Neovim core (0.12+)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.treesitter.start()
  end,
})
