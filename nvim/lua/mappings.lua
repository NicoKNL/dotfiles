local map = vim.api.nvim_set_keymap

local opt = {
    noremap = true
}

-- Move lines up and down
map("n", "=", "ddkP", opt)
map("n", "-", "ddp", opt)

map("v", "<leader>rl", "<cmd>lua require('functions').reverseLines()<CR>", opt)
