-- =============================================================================
-- NEOTEST — test runner UI
-- neotest: core framework
-- neotest-python: pytest/unittest adapter
-- neotest-jest: Jest/TypeScript adapter
-- FixCursorHold: fixes CursorHold perf (neotest dep)
-- =============================================================================

vim.pack.add({
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/nvim-neotest/neotest",
  "https://github.com/nvim-neotest/neotest-python",
  "https://github.com/nvim-neotest/neotest-jest",
  "https://github.com/antoinemadec/FixCursorHold.nvim",
})

require("neotest").setup({
  log_level = vim.log.levels.WARN,
  adapters = {
    require("neotest-jest")({
      -- Suppress interactive watch mode so neotest gets clean output
      env = { CI = "true" },
    }),
    require("neotest-python")({
      runner = "pytest",
      -- Use `uv run python` for uv projects, fall back to system python3
      python = function(root)
        local has_uv = vim.fn.filereadable(root .. "/uv.lock") == 1
          or vim.fn.filereadable(root .. "/pyproject.toml") == 1
        if has_uv then
          return { "uv", "run", "python" }
        end
        return { "python3" }
      end,
      -- Shell out to pytest to discover parametrized test instances
      pytest_discover_instances = true,
    }),
  },
})

-- ---------------------------------------------------------------------------
-- Keymaps — all under <leader>t
-- ---------------------------------------------------------------------------
local map = vim.keymap.set
local nt = require("neotest")

map("n", "<leader>tn", function() nt.run.run() end,                        { desc = "Test: run nearest" })
map("n", "<leader>tf", function() nt.run.run(vim.fn.expand("%")) end,      { desc = "Test: run file" })
map("n", "<leader>ts", function() nt.run.run(vim.fn.getcwd()) end,         { desc = "Test: run suite" })
map("n", "<leader>tl", function() nt.run.run_last() end,                   { desc = "Test: run last" })
map("n", "<leader>tx", function() nt.run.stop() end,                       { desc = "Test: stop" })
map("n", "<leader>to", function() nt.output.open({ enter = true }) end,    { desc = "Test: open output" })
map("n", "<leader>tS", function() nt.summary.toggle() end,                 { desc = "Test: toggle summary" })
map("n", "<leader>tp", function() nt.output_panel.toggle() end,            { desc = "Test: toggle output panel" })
map("n", "]t", function() nt.jump.next({ status = "failed" }) end,         { desc = "Test: next failed" })
map("n", "[t", function() nt.jump.prev({ status = "failed" }) end,         { desc = "Test: prev failed" })
