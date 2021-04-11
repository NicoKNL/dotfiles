local M = {}

local function getSelectedLines()
  local _, first_line, _, _ = unpack(vim.fn.getpos("'<"))
  local _, last_line,  _, _ = unpack(vim.fn.getpos("'>"))

  if last_line < first_line  then
    return last_line, first_line
  else
    return first_line, last_line
  end
end

function M.reverseLines()
  local first_line, last_line = getSelectedLines()
  local reversed_lines = {}
  for i = last_line, first_line, -1 do
    reversed_lines[#reversed_lines + 1] = vim.fn.getline(i)
  end

  print("reversed_lines: ", table.concat(reversed_lines, ", "))

  for i = #reversed_lines, 1, -1 do
    print("i: ", i)
    vim.fn.setline(first_line + i - 1, reversed_lines[i])
  end
end

function M.applyConfiguration(config)
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

function M.printSelection()
  local first_line, last_line = getSelectedLines()
  print(first_line, last_line)
end

return M
