
print("Hello from todo plugin!")

--local api = vim.api
local buf, win

local function open_window()
    buf = vim.api.nvim_create_buf(false, true)  -- Creates a new empty buffer

    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')  

    -- get dimensions
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")

    -- calculate out floating window size
    local win_width = math.ceil(width * 0.8)
    local win_height = math.ceil(height * 0.8 - 4)

    -- calculate starting position
    local row = math.ceil((height - win_height) / 2 - 1)
    local col = math.ceil((width - win_width) / 2)

    -- set some options
    local opts = {
        style = "minimal",
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col
    }

    -- finally crate the window with a buffer attached
    win = vim.api.nvim_open_win(buf, true, opts)

    print("Hello from function!")

end

return {
    open_window = open_window
}
