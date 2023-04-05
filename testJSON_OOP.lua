local JSON = require("lua.todo.json.json_utils")
local ITEM = require("lua.todo.item.item")
local LIST = require("lua.todo.list.list")
local FILE_IO = require("lua.todo.file-io.file-io")
local PATH = require("lua.todo.path.path_utils")

--[[
item1 = ITEM:newItem()
item2 = ITEM:newItem()

LIST:addItem(item1)
LIST:addItem(item2)

--print("LIST")
--print(vim.inspect(LIST.items))

ITEM:setDesc(item1, 'Do laundry')
ITEM:toggle_state(item1)

ITEM:setDesc(item2, 'Play games')
ITEM:toggle_state(item2)

print("LIST AFTER TOGGLE")
print(vim.inspect(LIST.items))

--print(PATH:get_path_to_directory())

local str = JSON.encode(LIST.items)

FILE_IO:writeFile(PATH:get_path_to_directory() .. '/.todo/todo.json', str)
--]]

local contents = FILE_IO:readFile(PATH:get_path_to_directory() .. "/.todo/todo.json")

contents = JSON.decode(contents)

--print(vim.inspect(contents))

--LIST:removeAll()

--[[
for item in pairs(contents) do
    LIST.addItem(item)
end
--]]

LIST.items = contents

--print(vim.inspect(LIST.items))

--local item3 = ITEM:newItem()

LIST:addItem(ITEM:newItem())

print(vim.inspect(LIST.items))

local str = JSON.encode(LIST.items)

FILE_IO:writeFile(PATH:get_path_to_directory() .. '/.todo/todo.json', str)

--[[
json_all = JSON.encode(LIST.items)

print(json_all)

items = JSON.decode(json_all)

print(vim.inspect(items))
--]]
