
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

    -- set some options for main window
    local opts = {
        style = "minimal",
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col
    }

----------------------------------------------------------------------------------------------
-- Border 

    -- set border options
    local border_opts = {
        style = "minimal",
        relative = "editor",
        width = win_width + 2,
        height = win_height + 2,
        row = row - 1,
        col = col -1
    }

    local border_buf = vim.api.nvim_create_buf(false, true)

    local border_lines = { 'T' .. string.rep('=', win_width) .. 'T' }
    local middle_line = '|' .. string.rep(' ', win_width) .. '|'
    for i=1, win_height do
        table.insert(border_lines, middle_line)
    end
    table. insert(border_lines, 'L' .. string.rep('=', win_width) .. 'L')

    vim.api.nvim_buf_set_lines(border_buf, 0, -1, false, border_lines)
    -- set buffer's (border_buf) lines from first line (0) to last (-1)
    -- ignoring out of bounds error (false) with lines (border_lines)

    local border_win = vim.api.nvim_open_win(border_buf, true, border_opts)
----------------------------------------------------------------------------------------------


    -- finally crate the window with a buffer attached
    win = vim.api.nvim_open_win(buf, true, opts)


----------------------------------------------------------------------------------------------
    -- This allows the two buffers to close together
    vim.api.nvim_command('au BufWipeout <buffer> exe "silent bwipeout! "'..border_buf)
----------------------------------------------------------------------------------------------

    print("Hello from function!")

end


----------------------------------------------------------------------------------------------
-- Key mappings
--local function set_mappings()
--    local mappings = {
--        ['td'] = 'open_window()',
--    }
--
--    for k,v in pairs(mappings) do
--        vim.api.nvim_set_keymap('n', '<leader>'..k, ':lua require('todo.todo').'..v..'<cr>', {
--            nowait = true, noremap = true, silent = true
--        })
--    end
--end
----------------------------------------------------------------------------------------------


return {
    open_window = open_window
    --set_mappings = set_mappings
}
