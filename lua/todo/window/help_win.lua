local utils = require("todo.window.win_utils")

local M = {}

local buf = nil
local win = nil

-- Constructs a string representing a border with a string in the center
local function center(str)
  local width = vim.api.nvim_win_get_width(0)
  local shift = math.floor(width / 2) - math.floor(string.len(str) / 2)
  if width%2 == 0 then
    return '╭' .. string.rep('─', shift) .. str .. string.rep('─', shift) .. '╮'
  else
    return '╭' .. string.rep('─', shift+1) .. str .. string.rep('─', shift) .. '╮'
  end
end

-- Close the help window
function M.close_window()
  vim.api.nvim_win_close(win, true)
end

-- Open the help window
function M.open_window()
  buf = vim.api.nvim_create_buf(false, true)
  local border_buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_name(buf, 'Todo-List Help')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(buf, 'filetype', 'todo-list-help')

  local main_opts, border_opts, border_lines = utils.get_help_win_opts()

  vim.api.nvim_buf_set_lines(border_buf, 0, -1, false, border_lines)

  local border_win = vim.api.nvim_open_win(border_buf, true, border_opts)

  win = vim.api.nvim_open_win(buf, true, main_opts)

  vim.api.nvim_win_set_option(win, 'wrap', true)

  -- Make both buffers close at the same time
  vim.api.nvim_command(
    'au BufWipeout <buffer> exe "silent bwipeout!"'..border_buf
  )

  vim.cmd(
    "au BufLeave <buffer=" .. buf .. "> ++once silent \z
    lua require('todo.window.help_win').close_window()"
  )

  vim.api.nvim_buf_set_lines(border_buf, 0, 1, false, {center('HELP')})

  vim.api.nvim_buf_set_keymap(
    buf,
    'n',
    'h',
    ':lua require("todo.todo").help()<cr>',
    { nowait = true, noremap = true, silent = true}
  )

  local mappings = require("todo.keymap.keymap")
  local lines = {}
  for k,v in pairs(mappings) do
    table.insert(lines, k .. " : " .. v.desc)
    table.insert(lines, "")
  end

  vim.api.nvim_buf_set_lines(buf, 0, #lines, false, lines)
end

return M
