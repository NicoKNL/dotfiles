-- =============================================================================
-- HARPOON 2 — fast file navigation
-- =============================================================================
-- Keymaps:
--   <leader>ha  add current file to harpoon list
--   <leader>hh  toggle quick menu
--   <leader>1-9 jump to slot 1–9
--   [h / ]h     navigate to prev / next in list

vim.pack.add({
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

local ok, harpoon = pcall(require, "harpoon")
if not ok then return end

harpoon:setup()

local map = vim.keymap.set

map("n", "<leader>ha", function() harpoon:list():add() end,                        { desc = "Harpoon: add file" })
map("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: quick menu" })

map("n", "[h", function() harpoon:list():prev() end, { desc = "Harpoon: prev" })
map("n", "]h", function() harpoon:list():next() end, { desc = "Harpoon: next" })

for i = 1, 9 do
  map("n", "<leader>" .. i, function() harpoon:list():select(i) end, { desc = "Harpoon: slot " .. i })
end
