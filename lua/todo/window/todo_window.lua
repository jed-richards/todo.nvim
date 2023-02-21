-- Pull in utils
local utils = require('todo.window.win_utils')


-- This is for the code for the window set up of the todo plugin 

--local api = vim.api
local main_buf, win


-- Open Window Function
local function open_window()

    local dir_path = utils.get_path_to_directory()
    local file_path = utils.get_path_to_file()

    print(dir_path)
    print(file_path)

    -- get dimensions for window based on current window
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")

    -- calculate out floating window size
    local win_width = math.ceil(width * 0.8)
    local win_height = math.ceil(height * 0.8 - 4)

    -- calculate starting position
    local row = math.ceil((height - win_height) / 2 - 1)
    local col = math.ceil((width - win_width) / 2)

    -- set main window options
    local opts = {
        style = "minimal",
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col
    }

    -- set border options
    local border_opts = {
        style = "minimal",
        relative = "editor",
        width = win_width + 2,
        height = win_height + 2,
        row = row - 1,
        col = col -1
    }

    -- Create main buffer
    --main_buf = vim.api.nvim_create_buf(false, true)
    --vim.api.nvim_buf_set_option(main_buf, 'bufhidden', 'wipe')

    --vim.api.nvim_buf_set_name(main_buf, dir_path..'/.todo/todo.txt')
    --vim.api.nvim_buf_call(main_buf, vim.cmd.edit)

    main_buf = vim.fn.bufadd(dir_path..'/.todo/todo.txt')
    vim.api.nvim_buf_set_option(main_buf, 'bufhidden', 'wipe')
    vim.fn.bufload(main_buf)
    print(dir_path..'/.todo/todo.txt:')
    utils.print_buffer_contents(main_buf)

    -- Create border buffer
    local border_buf = vim.api.nvim_create_buf(false, true)

    -- Create border lines for border buffer
    local border_lines = { '╭' .. string.rep('─', win_width) .. '╮' }
    local middle_line = '│' .. string.rep(' ', win_width) .. '│'
    for i=1, win_height do
        table.insert(border_lines, middle_line)
    end
    table.insert(border_lines, '╰' .. string.rep('─', win_width) .. '╯')

    -- set border buffer lines from first line (0) to last (-1)
    -- ignoring out of bounds error (false) with lines (border_lines)
    vim.api.nvim_buf_set_lines(border_buf, 0, -1, false, border_lines)

    -- create a window for border buffer
    local border_win = vim.api.nvim_open_win(border_buf, true, border_opts)

    -- create a window for the main buffer
    win = vim.api.nvim_open_win(main_buf, true, opts)

    -- This allows the two buffers to close together
    vim.api.nvim_command(
        'au BufWipeout <buffer> exe "silent bwipeout! "'..border_buf
    )

    print("Hello from open window function!")
end

return {
    open_window = open_window
}
