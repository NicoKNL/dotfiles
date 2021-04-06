local execute = vim.api.nvim_command

execute("autocmd VimEnter * set termguicolors")
execute("autocmd VimEnter * colorscheme onedark")
execute("let g:airline_theme='onedark'")
