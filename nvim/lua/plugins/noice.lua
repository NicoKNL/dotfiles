vim.pack.add({
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/rcarriga/nvim-notify",
  "https://github.com/folke/noice.nvim",
})

require("notify").setup({
  background_colour = "#000000",
  timeout = 3000,
  render = "compact",
})

require("noice").setup({
  lsp = {
    -- override markdown rendering so that cmp and other plugins use Treesitter
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
  presets = {
    bottom_search = true,         -- classic bottom cmdline for search
    command_palette = true,       -- position cmdline + popupmenu together
    long_message_to_split = true, -- long messages go to split
    inc_rename = false,
    lsp_doc_border = true,        -- border around hover docs / signature help
  },
  notify = {
    enabled = true,
    view = "notify",
  },
})
