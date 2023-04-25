local utils = require("todo.window.win_utils")
local api = vim.api
local buf = nil
local win = nil

local M = {}

-- boolean used to check if we need to save contents
M.changed = false

-- Constructs a string representing a border with a string in the center
local function center(str)
  local width = api.nvim_win_get_width(0)
  local shift = math.floor(width / 2) - math.floor(string.len(str) / 2)
  if width%2 == 0 then
    return '╭' .. string.rep('─', shift-1) .. str .. string.rep('─', shift) .. '╮'
  else
    return '╭' .. string.rep('─', shift) .. str .. string.rep('─', shift) .. '╮'
  end
end

-- Close the main window
function M.close_window()
  api.nvim_win_close(win, true)
end

-- Open the main window
function M.open_window()
  -- Create buffers
  buf = vim.api.nvim_create_buf(false, true)
  local border_buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_name(buf, 'Todo-List')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(buf, 'filetype', 'todo-list')

  local main_opts, border_opts, border_lines = utils.get_win_options()

  vim.api.nvim_buf_set_lines(border_buf, 0, -1, false, border_lines)

  local border_win = vim.api.nvim_open_win(border_buf, true, border_opts)
  win = api.nvim_open_win(buf, true, main_opts)

  -- Make both buffers close at the same time
  vim.api.nvim_command('au BufWipeout <buffer> exe "silent bwipeout! "'..border_buf)

  vim.cmd(
    "au BufLeave <buffer=" .. buf .. "> ++once silent \z
    lua require('todo.window.window').close_window()"
  )

  vim.api.nvim_win_set_option(win, 'cursorline', true)
  vim.api.nvim_win_set_option(win, 'number', true)
  vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:Normal')

  api.nvim_buf_set_lines(border_buf, 0, 1, false, {center('TODO LIST')})

  return buf, win
end

-- adds an item as a string to the buffer at the end of the list
function M.add_item(item_str)
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  if (#lines == 1 and lines[1] == '') then
    vim.api.nvim_buf_set_lines(buf, 0, 1, false, {item_str})
  else
    vim.api.nvim_buf_set_lines(buf, -1, -1, false, {item_str})
  end
  M.changed = true
end

-- removes a line at a specific index in the buffer
function M.remove_item(idx)
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  if (#lines == 1 and lines[1] == '') then
    print('There are no items to remove.')
  else
    vim.api.nvim_buf_set_lines(buf, idx-1, idx, false, {})
    M.changed = true
  end
end

-- Returns all lines in the main buffer
function M.get_lines()
  return vim.api.nvim_buf_get_lines(buf, 0, -1, false)
end

-- Returns the line at a specified index
function M.get_line(idx)
  return vim.api.nvim_buf_get_lines(buf, idx-1, idx, false)
end

-- Changes the line at a specified index
function M.set_line(line, idx)
  return vim.api.nvim_buf_set_lines(buf, idx-1, idx, false, {line})
end

-- Sets a table of keymaps for the main buffer
function M.set_mappings(mappings)
  for k,v in pairs(mappings) do
    api.nvim_buf_set_keymap(buf, 'n', k, ':lua require("todo.todo").'..v.func..'<cr>', {
      nowait = true, noremap = true, silent = true
    })
  end
end

return M
