local item_methods = {}
local idx = {__index = item_methods}

function item_methods:toggle_state()
    if (self.details.state == "marked") then
        self.details.state = "unmarked"
    else
        self.details.state = "marked"
    end
    self:update_icon()
end

Item = {}

Item.icons = {
    unmarked = '󰄱',
    marked = '󰡖',
}

Item.details = {
    desc = "",
    state = "unmarked",
    icon = ""
}

function Item:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

-- updates icon based on the state
function Item:update_icon()
    self.details.icon = self.icons[self.details.state]
end

-- Toggles between states and updates icon
function Item:toggle_state()
    if (self.details.state == "marked") then
        self.details.state = "unmarked"
    else
        self.details.state = "marked"
    end
    self:update_icon()
end

-- Functionality to change the items description
function Item:setDesc(str)
    self.details.desc = str
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


