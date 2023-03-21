local List = require('todo.list.list')

local function make_Item(desc)
    local item = require('todo.item.item')
    item.setDesc(desc)
    return item
end

--[[
local item1 = {
    desc = 'Description 1',
    state = 'Done'
}

local item2 = {
    desc = 'Description 2',
    state = 'Not Done'
}

local item3 = {
    desc = 'Description 3',
    state = 'Not Done'
}

local item4 = {
    desc = 'Description 4',
    state = 'Done'
}
--]]

local item1 = make_Item("Description 1")
local item2 = make_Item("Description 2")
local item3 = make_Item("Description 3")
local item4 = make_Item("Description 4")

--List.addItem(item1)
--List.addItem(item2)
--List.addItem(item3)
--List.addItem(item4)

--List.removeItem(1)
--List.removeItem(2)
--List.removeItem(3)
--List.removeItem(4)

--List.removeAll()

--print(List.numItems())

--print(vim.inspect(List))
print(vim.inspect(item1))
