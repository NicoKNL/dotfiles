require("functions").applyConfiguration({
    -- INDENTATION
    tabstop     = 4,
    softtabstop = 4,
    shiftwidth  = 4,
    shiftround  = true,
    expandtab   = true,

    -- LINE (NUMBERS) 
    number         = true,
    relativenumber = true,
    scrolloff      = 8,

    -- OTHER
    clipboard   = vim.o.clipboard .. "unnamedplus",
    guicursor   = "",
    hlsearch    = false,
    incsearch   = true,
    hidden      = true,
    errorbells  = false,
    wrap        = false,
    swapfile    = false,
    backup      = false,
    signcolumn  = "yes",
    colorcolumn = "80"
})


