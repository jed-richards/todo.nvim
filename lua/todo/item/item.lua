local Item = {}

    Item.icons = {
        unmarked = '󰄱',
        marked = '󰡖',
    }

    -- Default item look
    Item.desc = ""
    Item.state = "unmarked"
    Item.icon = ""

    --[[
        Item = {
            desc = "Drink water",
            state = "marked",
            icon = "󰡖"
        }
    --]]

    -- updates icon based on the state
    function Item.update_icon()
        Item["icon"] = Item.icons[Item.state]
    end

    -- Toggles between states and updates icon
    function Item.toggle_state()
        if (Item["state"] == "marked") then
            Item["state"] = "unmarked"
        else
            Item["state"] = "marked"
        end
        Item.update_icon()
    end

    -- Functionality to change the items description
    function Item.setDesc(str)
        Item["desc"] = str
    end

    -- Set initial icon
    Item.update_icon()

return Item
