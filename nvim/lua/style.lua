local execute = vim.api.nvim_command

execute("autocmd VimEnter * set termguicolors")
execute("autocmd VimEnter * colorscheme onedark")
execute("autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE")
execute("let g:airline_theme='onedark'")
