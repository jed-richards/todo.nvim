local List = require('todo.list.list')

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

--List.addItem(item1)
--List.addItem(item2)
--List.addItem(item3)
--List.addItem(item4)

--List.removeItem(1)
--List.removeItem(2)
--List.removeItem(3)
--List.removeItem(4)

List.removeAll()

print(vim.inspect(List))
