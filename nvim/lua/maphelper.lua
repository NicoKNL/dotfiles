local map = vim.api.nvim_set_keymap
local M = {}

local function _splitStringOnDot(s)
    local result = {}

    for element in string.gmatch(s, ".") do
        result[#result + 1] = element
    end

    return result[1], result[2]
end

local function _applyMap(mode, lhs, rhs, opts)
    local source, function_name = _splitStringOnDot(rhs)
    print(source, function_name)
    -- vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function M.nmap(lhs, rhs) --, ...)
    print("hi: ", lhs, rhs)
    _applyMap("n", lhs, rhs, {})
end

return M
-- nmap("<leader>x", "functions.hello")

