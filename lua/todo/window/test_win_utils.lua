local M = {}


    -- Returns a string of the full path to current buffer including
    -- the file in the current buffer.
    --   ex.) /home/username/path/to/file.txt
    function M.get_path_to_file()
        return vim.api.nvim_buf_get_name(0)
    end

    -- Returns a string of the full path to current buffer NOT including
    -- the file in the current buffer.
    --   ex.) /home/username/path/to
    function M.get_path_to_directory()
        return vim.fn.expand('%:h')
    end

    -- idk if i even need this
    function M.print_buffer_contents(bufnr)
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true)

        --if (vim.tbl_isempty(lines)) then
        --    print('[unloaded buffer]\n')
        --elseif (#lines == 1 and lines[1] == '') then
        --    print('[empty buffer]\n')
        --else
        --    print(table.concat(lines, '\n')..'\n')
        --end

    end

    -- Creates a border buffer for the main buffer based of the 
    -- size of the current window.
    function M.create_border_buf()
        local border_buf = vim.api.nvim_create_buf(false, false)

        -- get dimensions for window based on current window
        local width = vim.api.nvim_get_option("columns")
        local height = vim.api.nvim_get_option("lines")
        local win_width = math.ceil(width * 0.2)
        local win_height = math.ceil(height * 0.4 - 1)

        -- Create border lines for border buffer
        local border_lines = { '╭' .. string.rep('─', win_width/2 - 5) .. ' TODO LIST ' .. string.rep('─', win_width/2 - 5) .. '╮' }
        --local border_lines = { '╭' .. string.rep('─', win_width) .. '╮' }
        local middle_line = '│' .. string.rep(' ', win_width) .. '│'
        for i=1, win_height do
            table.insert(border_lines, middle_line)
        end
        table.insert(border_lines, '╰' .. string.rep('─', win_width) .. '╯')

        -- set border buffer lines from first line (0) to last (-1)
        -- ignoring out of bounds error (false) with lines (border_lines)
        vim.api.nvim_buf_set_lines(border_buf, 0, -1, false, border_lines)

        return border_buf
    end

    -- Creates main buffer with file ./.todo/todo.txt. If todo.txt does not 
    -- exist it makes the file when you write the file.
    function M.create_main_buf()
        local dir_path = M.get_path_to_directory()
        local main_buf = vim.fn.bufadd(dir_path .. '/.todo/todo.txt')
        vim.api.nvim_buf_set_option(main_buf, 'bufhidden', 'wipe')
        vim.fn.bufload(main_buf)
        vim.api.nvim_buf_set_keymap(
            main_buf,
            "n",
            "q",
            ":wq<CR>",
            { silent = true }
        )
        vim.api.nvim_buf_set_keymap(
            main_buf,
            "n",
            "<leader>td",
            ":wq<CR>",
            { silent = true }
        )
        return main_buf
    end

    -- Returns the default window options for main buffer and border
    -- buffer based on the current window.
    function M.get_win_options()
        -- get dimensions for window based on current window
        local width = vim.api.nvim_get_option("columns")
        local height = vim.api.nvim_get_option("lines")

        -- calculate floating window size
        local win_width = math.ceil(width * 0.2)
        local win_height = math.ceil(height * 0.4 - 1)

        -- calculate starting position
        local row = math.ceil((height - win_height) / 2 - 1)
        local col = math.ceil((width - win_width) / 2)

        -- set main window options
        local main_opts = {
            style = "minimal",
            relative = "editor",
            width = win_width,
            height = win_height,
            row = row,
            col = col,
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

        return main_opts, border_opts
    end


return M
