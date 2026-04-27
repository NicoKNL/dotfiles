-- =============================================================================
-- LSP — language server protocol (go-to-definition, references, hover, etc.)
-- =============================================================================
-- Uses Neovim 0.11+ native vim.lsp.config — no plugins needed.
--
-- Language servers (must be installed on system):
--   ty                   → add to project deps (uv run ty server)
--   ts_ls                → npm install -g typescript typescript-language-server
--   yaml-language-server → npm install -g yaml-language-server
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

-- Python — ty (Astral)
vim.lsp.config("ty", {
  cmd = { "uv", "run", "ty", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "uv.lock", "setup.py", "setup.cfg", ".git" },
})

-- TypeScript / JavaScript — ts_ls
vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
})

-- YAML — yaml-language-server
vim.lsp.config("yamlls", {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose" },
  root_markers = { ".git" },
})

vim.lsp.enable({ "ty", "ts_ls", "yamlls" })
