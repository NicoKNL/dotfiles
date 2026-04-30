-- =============================================================================
-- CONFORM — format on save
-- =============================================================================
-- Formatters run per-project, no global installs required:
--   Python  → `uv run ruff format` (any uv-managed project)
--   JS/TS/YAML → `npx prettier` (any npm project, auto-installs via npx)
-- Keymaps:
--   <leader>cf  format current buffer manually

vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
})

local ok, conform = pcall(require, "conform")
if not ok then return end

conform.setup({
  -- Custom formatter definitions
  formatters = {
    ruff_uv = {
      command = "uv",
      args = { "run", "ruff", "format", "--stdin-filename", "$FILENAME", "-" },
      stdin = true,
      cwd = require("conform.util").root_file({ "pyproject.toml", "uv.lock" }),
    },
    prettier_npx = {
      command = "npx",
      args = { "--yes", "prettier", "--stdin-filepath", "$FILENAME" },
      stdin = true,
      cwd = require("conform.util").root_file({ "package.json" }),
    },
  },
  formatters_by_ft = {
    python          = { "ruff_uv" },
    javascript      = { "prettier_npx" },
    typescript      = { "prettier_npx" },
    javascriptreact = { "prettier_npx" },
    typescriptreact = { "prettier_npx" },
    yaml            = { "prettier_npx" },
  },
  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = false,
  },
  notify_on_error = false,
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  conform.format({ async = true, lsp_fallback = false })
end, { desc = "Format buffer" })
