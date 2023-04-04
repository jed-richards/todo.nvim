local JSON = require("lua.todo.json.json_utils")
local ITEM = require("oop")
local LIST = require("lua.todo.list.list")

item1 = ITEM:newItem()
item2 = ITEM:newItem()

LIST.addItem(item1)
LIST.addItem(item2)

print("LIST")
print(vim.inspect(LIST.items))

ITEM:setDesc(item1, 'item1 desc')

print(vim.inspect(item1))
print(vim.inspect(item2))

ITEM:toggle_state(item1)

print("AFTER TOGGLE")

print(vim.inspect(item1))
print(vim.inspect(item2))

print("LIST")
print(vim.inspect(LIST.items))

print()

--LIST.removeAll()

--json1 = JSON.encode(item1)

json_all = JSON.encode(LIST.items)
--]]

print(json_all)

items = JSON.decode(json_all)

print(vim.inspect(items))
