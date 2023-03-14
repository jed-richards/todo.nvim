local JSON = require('todo.json.json_utils')

local dict = {
    names = {
        'jed',
        'kenadie',
        'eric'
    },
    food = {
        'pizza',
        'bread',
        'fruit'
    }
}

--local enc = JSON.encode(dict)
--
--print(vim.inspect(enc))
--
--local dec = JSON.decode(enc)
--
--print(vim.inspect(dec))
--
local filename = 'lua/todo/json/test.json'
--
--local file = io.open(filename, "w")
--
--file:write(enc)
--
--file:close()

local file = io.open(filename, "r")

local str = file:read()

print(str)

local dec = JSON.decode(str)

print(vim.inspect(dec))


