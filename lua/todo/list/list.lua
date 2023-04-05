local M = {}

    M.items = {}

    -- Returns the number of items/elements in items table
    function M:numItems()
        return table.getn(M.items)
    end

    -- Adds an item to items table
    function M:addItem(item)
        table.insert(M.items, item)
    end

    -- Returns 0 if idx is not in range. 
    -- Returns 1 if idx is in range and removes item from items table
    function M:removeItem(idx)
        if ( M:numItems() < idx or idx < 0 ) then
            return 0
        else
            table.remove(M.items, idx)
            return 1
        end
    end

    -- Set items to an empty table
    function M:removeAll()
        M.items = {}
    end

    -- Returns 0 if items table is not empty and 1 if items is 1
    function M.empty()
        if (M.numItems() > 0) then
            return 0
        else
            return 1
        end
    end

return M
