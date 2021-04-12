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

  for i = #reversed_lines, 1, -1 do
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

local function splitAndStrip(str, delimiter)
  local result = {}

  for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, (match:gsub("^%s*(.-)%s*$", "%1")))
  end

  return result
end

local function getMarkdownTableColumnWidthsForRow(line_number)
  local row_text = vim.fn.getline(line_number)
  local column_widths = {}

  for _, cell_text in ipairs(splitAndStrip(row_text, "|")) do
    table.insert(column_widths, #cell_text)
  end

  return column_widths 
end

local function getMarkdownTableColumnWidthsForTable(first_line, last_line)
  local column_widths = {}

  for line_number = first_line, last_line do
    local line_column_widths = getMarkdownTableColumnWidthsForRow(line_number)

    for i = 1, #line_column_widths do
      if i > #column_widths then
        column_widths[i] = line_column_widths[i]
      else
        column_widths[i] = math.max(column_widths[i], line_column_widths[i])
      end
    end
  end
  
  return column_widths
end

local function addPaddingToTableCells(first_line, last_line, column_widths)
  for line_number = first_line, last_line do
    local row_text   = vim.fn.getline(line_number)
    local cell_texts = splitAndStrip(row_text, "|")

    local formatted_row = ""

    for i = 1, #column_widths do
      if i > 1 then
        formatted_row = formatted_row .. " | "
      end
      
      if cell_texts[i]:sub(1, 1) == "-" then
        formatted_row = formatted_row .. string.rep("-", column_widths[i])
      else
        formatted_row = formatted_row .. cell_texts[i]

        local missing_length = column_widths[i] - #cell_texts[i]
        if missing_length > 0 and i < #column_widths then
          formatted_row = formatted_row .. string.rep(" ", missing_length)
        end
      end
    end

    vim.fn.setline(line_number, formatted_row)
  end
end

function M.formatMarkdownTable()
  local first_line, last_line = getSelectedLines()
  local max_column_widths = getMarkdownTableColumnWidthsForTable(first_line, last_line)
  addPaddingToTableCells(first_line, last_line, max_column_widths)
end

return M
