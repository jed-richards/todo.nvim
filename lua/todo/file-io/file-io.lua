JSON = require('todo.json.json_utils')

local M = {}

-- Returns file contents in the form of a table
function M:readFile(filepath)
    local file = io.open(filepath, "r")
    local str = file:read()
    file:close()
    local contents = JSON.decode(str)
    return contents
end

-- Write a table to a file as a json string
function M:writeFile(filepath, items_tbl)
    local file = io.open(filepath, "w")
    local str = JSON.encode(items_tbl)
    file:write(str)
    file:close()
end

return M
