vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

-- Install parsers
require("nvim-treesitter").install({ "python", "yaml" })

-- Highlighting via Neovim core (0.12+)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.treesitter.start()
  end,
})

-- Folding: treesitter-based by default, indent fallback
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local ok = pcall(vim.treesitter.get_parser, 0)
    if not ok then
      vim.opt_local.foldmethod = "indent"
    end
  end,
})
