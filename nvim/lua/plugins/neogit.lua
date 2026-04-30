vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/NeogitOrg/neogit",
})

local ok, neogit = pcall(require, "neogit")
if not ok then return end

neogit.setup({
  kind = "floating",
  integrations = {
    diffview  = true,
    telescope = true,
  },
})

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit" })
