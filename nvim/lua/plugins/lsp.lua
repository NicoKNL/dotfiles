-- =============================================================================
-- LSP — language server protocol (go-to-definition, references, hover, etc.)
-- =============================================================================
-- Uses Neovim 0.11+ native vim.lsp.config — no plugins needed.
--
-- Language servers (must be installed on system):
--   pyright   → npm install -g pyright
--   ts_ls     → npm install -g typescript typescript-language-server
--
-- Keymaps (active when LSP attaches to buffer):
--   gd          go to definition
--   gD          go to declaration
--   gr          go to references
--   gi          go to implementation
--   K           hover documentation
--   <leader>rn  rename symbol
--   <leader>ca  code actions
--   [d / ]d     previous / next diagnostic
--   <leader>d   show diagnostics for current line

-- Diagnostic display
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Keymaps on LSP attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
    end

    map("gd",         vim.lsp.buf.definition,     "Go to definition")
    map("gD",         vim.lsp.buf.declaration,    "Go to declaration")
    map("gr",         vim.lsp.buf.references,     "Go to references")
    map("gi",         vim.lsp.buf.implementation, "Go to implementation")
    map("K",          vim.lsp.buf.hover,          "Hover documentation")
    map("<leader>rn", vim.lsp.buf.rename,         "Rename symbol")
    map("<leader>ca", vim.lsp.buf.code_action,    "Code actions")
    map("[d",         vim.diagnostic.goto_prev,   "Previous diagnostic")
    map("]d",         vim.diagnostic.goto_next,   "Next diagnostic")
    map("<leader>d",  vim.diagnostic.open_float,  "Show line diagnostics")
  end,
})

-- Python — Pyright
vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoImportCompletions = true,
      },
    },
  },
})

-- TypeScript / JavaScript — ts_ls
vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
})

vim.lsp.enable({ "pyright", "ts_ls" })
