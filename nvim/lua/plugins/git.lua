-- =============================================================================
-- GIT (gitsigns + diffview)
-- gitsigns: inline gutter diffs, hunk navigation, stage hunks
-- diffview: VS Code-style diff panel and file history
-- =============================================================================

vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/sindrets/diffview.nvim",
})

-- ---------------------------------------------------------------------------
-- gitsigns — inline diff signs in the gutter
-- ---------------------------------------------------------------------------
require("gitsigns").setup({
  signs = {
    add          = { text = "▎" },
    change       = { text = "▎" },
    delete       = { text = "▁" },
    topdelete    = { text = "▔" },
    changedelete = { text = "▎" },
    untracked    = { text = "▎" },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- Navigate hunks
    map("n", "]g", gs.next_hunk,    "Next hunk")
    map("n", "[g", gs.prev_hunk,    "Prev hunk")

    -- Stage / reset hunk
    map("n", "<leader>gs", gs.stage_hunk,   "Stage hunk")
    map("n", "<leader>gr", gs.reset_hunk,   "Reset hunk")
    map("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk (visual)")
    map("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk (visual)")

    -- Preview hunk inline
    map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")

    -- Blame
    map("n", "<leader>gb", gs.blame_line,   "Blame line")
  end,
})

-- ---------------------------------------------------------------------------
-- diffview — VS Code-style diff panel
-- ---------------------------------------------------------------------------
require("diffview").setup({
  enhanced_diff_hl = true,   -- richer diff highlighting
  view = {
    default = {
      layout = "diff2_horizontal",   -- side-by-side like VS Code
    },
    file_history = {
      layout = "diff2_horizontal",
    },
  },
  file_panel = {
    listing_style = "tree",          -- tree view of changed files
    win_config = { width = 35 },
  },
  key_bindings = {
    disable_defaults = false,        -- keep diffview's own bindings
  },
})

local map = vim.keymap.set

-- Open diff panel for all changed files (VS Code's "Source Control" diff)
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>",            { desc = "Diff: open panel" })
-- Close diff panel
map("n", "<leader>gD", "<cmd>DiffviewClose<CR>",           { desc = "Diff: close panel" })
-- Current file's full git history (VS Code's "Timeline")
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>",   { desc = "Diff: file history" })
-- Repo-wide git history
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>",     { desc = "Diff: repo history" })
