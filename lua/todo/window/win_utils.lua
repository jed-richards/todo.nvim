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

    -- Returns the default window options for main buffer and border
    -- buffer based on the current window.
    function M.get_win_options()
        local width = vim.api.nvim_get_option("columns")
        local height = vim.api.nvim_get_option("lines")
        local win_height = math.ceil(height * 0.8 - 4)
        local win_width = math.ceil(width * 0.8)
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

        -- Create border lines for border buffer
        local border_lines = { '╭' .. string.rep('─', win_width) .. '╮' }
        local middle_line = '│' .. string.rep(' ', win_width) .. '│'
        for i=1, win_height do
            table.insert(border_lines, middle_line)
        end
        table.insert(border_lines, '╰' .. string.rep('─', win_width) .. '╯')

        return main_opts, border_opts, border_lines
    end

    function M.get_help_win_opts()
        local width = vim.api.nvim_get_option("columns")
        local height = vim.api.nvim_get_option("lines")
        local win_height = math.ceil(height * 0.4 - 2)
        local win_width = math.ceil(width * 0.4)
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

        -- Create border lines for border buffer
        local border_lines = { '╭' .. string.rep('─', win_width) .. '╮' }
        local middle_line = '│' .. string.rep(' ', win_width) .. '│'
        for i=1, win_height do
            table.insert(border_lines, middle_line)
        end
        table.insert(border_lines, '╰' .. string.rep('─', win_width) .. '╯')

        return main_opts, border_opts, border_lines
    end

return M
