--local win_utils = require('todo.window.win_utils')
local win_utils = require('todo.window.test_win_utils')
local path_utils = require('todo.path_utils')


local M = {}

    -- Open Window Function
    function M.open_window()

        -- Create directory in cwd if .todo directory does not exist
        if (path_utils.dir_exists('.todo', '%') == false) then
             --print('dir does not exist. making new dir')
             path_utils.make_dir('.todo', '%')
        end

        -- Get default window options
        local main_opts, border_opts = win_utils.get_win_options()
        local border_buf = win_utils.create_border_buf()
        local main_buf = win_utils.create_main_buf()

        -- create a window for border buffer
        border_win = vim.api.nvim_open_win(border_buf, true, border_opts)

        -- create a window for the main buffer
        win = vim.api.nvim_open_win(main_buf, true, main_opts)
        vim.api.nvim_win_set_option(win, "number", true)

        -- This allows the two buffers to close together
        vim.api.nvim_command(
            'au BufWipeout <buffer> exe "silent bwipeout! "'..border_buf
        )

    end

return M
