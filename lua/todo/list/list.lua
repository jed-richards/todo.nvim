local M = {}

-- A table to contain "Item objects"
M.items = {}

-- Returns the number of items/elements in items table
function M:numItems()
  return table.getn(M.items)
end

-- Adds an item to items table
function M:addItem(item)
  table.insert(M.items, item)
end

-- Removes and returns an item at a specified index. If the item is out of 
-- range, then the funtion returns an empyt table.
function M:removeItem(idx)
  if ( M:numItems() < idx or idx < 0 ) then
    return {}
  else
    local item = table.remove(M.items, idx)
    return item
  end
end

-- Set items to an empty table
function M:removeAll()
  M.items = {}
end

-- Returns 0 if items table is not empty and 1 if items is empty
function M.empty()
  if (M:numItems() > 0) then
    return 0
  else
    return 1
  end
end

return M
