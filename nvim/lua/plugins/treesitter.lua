vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("nvim-treesitter not ready. Restart nvim after install.", vim.log.levels.WARN)
  return
end

configs.setup({
  ensure_installed = { "python" },
  highlight = { enable = true },
  indent = { enable = true },
})
