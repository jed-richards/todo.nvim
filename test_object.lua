Item = {}

Item.icons = {
    unmarked = '󰄱',
    marked = '󰡖',
}

-- Default item look
Item.desc = ""
Item.state = "unmarked"
Item.icon = ""

function Item:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

-- updates icon based on the state
function Item:update_icon()
    self.icon = self.icons[self.state]
end

-- Toggles between states and updates icon
function Item:toggle_state()
    if (self["state"] == "marked") then
        self["state"] = "unmarked"
    else
        self["state"] = "marked"
    end
    self:update_icon()
end

-- Functionality to change the items description
function Item:setDesc(str)
    self["desc"] = str
end


item1 = Item:new()
item2 = Item:new()

item1:setDesc('item1 desc')

print(vim.inspect(item1))
print(vim.inspect(item2))

item1:toggle_state()

print('after toggle')

print(vim.inspect(item1))
print(vim.inspect(item2))

