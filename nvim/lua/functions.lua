local M = {}

local function visualSelectionRange()
  local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
  if csrow < cerow or (csrow == cerow and cscol <= cecol) then
    return csrow - 1, cscol - 1, cerow - 1, cecol
  else
    return cerow - 1, cecol - 1, csrow - 1, cscol
  end
end

function M.reverseLines()
    local csrow, cscol, cerow, cecol = visualSelectionRange()
    print(csrow)
    print(cscol)
    print(cerow)
    print(cecol)
end

return M
