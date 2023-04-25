local IO = require("todo.file-io.file-io")
local ITEM = require("todo.item.item")
local JSON = require("todo.json.json_utils")
local mappings = require("todo.keymap.keymap")
local LIST = require("todo.list.list")
local PATH = require("todo.path.path_utils")
local window = require("todo.window.window")
local help = require("todo.window.help_win")

local M = {}

M.buf = nil
M.win = nil
M.changed = false
M.help_open = false

-- Saves the todo list in the current working directory in '/.todo/todo.json'
local function save_contents()
  print('contents saved')
  local filename = PATH:get_path_to_directory() .. "/.todo/todo.json"
  IO:writeFile(filename, LIST.items)
  LIST.items = {}
end

-- Retrieves the contents in '/.todo/todo.json' or makes the directory
local function get_contents()
  local path = PATH:get_path_to_directory()
  local dir = path .. "/.todo"

  if (PATH:dir_exists(dir)) then
    local contents = IO:readFile(dir .. "/todo.json")
    return contents
  else
    PATH:make_dir(dir)
    return {}
  end
end

-- Turn an item table into a string
local function to_str(item)
  local str = item.icon .. "  " .. item.desc
  return str
end

-- Print items to the window
local function print_contents()
  if (LIST.items ~= {}) then
    for _,item in pairs(LIST.items) do
      window.add_item(to_str(item))
    end
  end
end

-- Returns the index of a line in the Todo-List window based on your cursor
-- position
function M.select_item()
  local idx = vim.fn.line(".", M.win)
  return idx
end

-- Add an item to the Todo-List
function M.add_item()
  local item = ITEM:newItem()
  local desc = vim.fn.input("Input item description: ")
  ITEM:setDesc(item, desc)
  LIST:addItem(item)

  local str = item.icon .. "  " .. item.desc
  window.add_item(str)

  M.changed = true
end

-- Removes an item from the Todo-List based on a specified index
function M.remove_item(idx)
  if (LIST.items ~= {}) then
    local item = LIST:removeItem(idx)  -- maybe want to log item
    window.remove_item(idx)
    M.changed = true
  end
end

-- Toggles an item as marked or not marked
function M.toggle_item(idx)
  local line = window.get_line(idx)
  ITEM:toggle_state(LIST.items[idx])
  line = to_str(LIST.items[idx])
  window.set_line(line, idx)
  M.changed = true
end

-- Opens or closes the Todo-List
function M.toggle_list()
  if (M.buf == nil and M.win == nil) then
    M.buf, M.win = window.open_window()
    LIST.items = get_contents()
    print_contents()
    window.set_mappings(mappings)
  else
    M.buf = nil
    M.win = nil
    if (M.changed) then
      save_contents()
    end
    window.close_window()
  end
end

-- Opens or closes the help window
function M.help()
  if not M.help_open then
    M.toggle_list()
    _,_ = help.open_window()
    M.help_open = true
  else
    help.close_window()
    M.help_open = false
    M.toggle_list()
  end
end

return M
