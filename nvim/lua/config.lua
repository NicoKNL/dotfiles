local configuration =
{
    -- INDENTATION
    tabstop     = 4,
    softtabstop = 4,
    shiftwidth  = 4,
    shiftround  = true,
    expandtab   = true,
    smartindent = true,

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
}

local function applyConfiguration(config)
    for option, value in pairs(config) do
        if value == true then
            vim.cmd("set " .. option)
        elseif value == false then
            vim.cmd("set no" .. option)
        else
            vim.cmd("set " .. option .. "=" .. value)
        end
    end
end

applyConfiguration(configuration)
