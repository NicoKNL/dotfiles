vim.pack.add({
  -- pin to v1 release tag so prebuilt Rust fuzzy binary is downloaded automatically
  { src = "https://github.com/saghen/blink.cmp", version = "v1.10.2" },
  "https://github.com/github/copilot.vim",
})

-- copilot.vim: disable all default keymaps (we'll wire Tab ourselves via blink)
vim.g.copilot_no_maps = true

require("blink.cmp").setup({
  keymap = {
    preset = "none",
    -- Tab: accept blink item if menu open, else accept Copilot ghost text, else fallback
    ["<Tab>"] = {
      function(cmp)
        if cmp.is_visible() then return cmp.accept() end
        local suggestion = vim.fn["copilot#GetDisplayedSuggestion"]()
        if suggestion.text ~= "" then
          local accept = vim.fn["copilot#Accept"]("")
          vim.api.nvim_feedkeys(accept, "n", true)
          return true
        end
      end,
      "fallback",
    },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide" },
    ["<CR>"] = { "accept", "fallback" },
  },

  appearance = {
    nerd_font_variant = "mono",
  },

  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },

  sources = {
    default = { "lsp", "path", "snippets" },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" },
})
