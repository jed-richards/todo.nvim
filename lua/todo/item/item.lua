local itemUtils = {}

itemUtils.icons = {
    unmarked = '󰄱',
    marked = '󰡖',
}

function itemUtils:newItem()
    return {
        desc = "Default description",
        state = "Unmarked",
        icon = '󰄱',
    }
end

-- updates icon based on the state
function itemUtils:update_icon(tbl)
    tbl.icon = itemUtils.icons[tbl.state]
end

-- Toggles between states and updates icon
function itemUtils:toggle_state(tbl)
    if (tbl.state == "marked") then
        tbl.state = "unmarked"
    else
        tbl.state = "marked"
    end
    itemUtils:update_icon(tbl)
end

-- Functionality to change the items description
function itemUtils:setDesc(tbl, str)
    tbl.desc = str
end

return itemUtils
