local List = require('todo.list.list')

local function makeItem(desc)
    local class = require('todo.item.testOOP')
    item = class.new()
    item:setDesc(desc)
    return item
end

--[[
local function make_Item(desc)
    local item = require('todo.item.item')
    item.setDesc(desc)
    return item
end
--]]

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

local item1 = makeItem("Description 1")
local item2 = makeItem("Description 2")
local item3 = makeItem("Description 3")
local item4 = makeItem("Description 4")

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
