local map = vim.api.nvim_set_keymap

local opt = {
    noremap = true
}

-- Move lines up and down
map("n", "=", "ddkP", opt)
map("n", "-", "ddp", opt)

map("v", "<leader>t", ":lua require('functions').printSelection()<CR>", opt)
map("v", "<leader>rl", ":lua require('functions').reverseLines()<CR>", opt)

local nmap = require("maphelper").nmap
nmap("hi", "test.me")
