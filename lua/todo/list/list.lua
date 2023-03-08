local M = {}

    M.todo_list = {}

    M.todo_list.items = {}

    Items = M.todo_list.items

    -- Returns the number of items/elements in Items table.
    function M.numItems()
        return table.getn(Items)
    end

    -- Adds an item to Items table.
    function M.addItem(item)
        table.insert(Items, item)
    end

    -- Returns 0 if idx is not in range. 
    -- Returns 1 if idx is in range and removes item from Items table.
    function M.removeItem(idx)
        if ( M.numItems() < idx or idx < 0 ) then
            return 0
        else
            table.remove(Items, idx)
            return 1
        end
    end

    -- Returns 0 if Items table is empty 
    -- Returns 1 if Items table is not empty then deletes all items
    function M.removeAll()
        table.foreachi(Items, function (k, v)
            Items[k] = nil
        end)
    end

return M
