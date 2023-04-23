local M = {}

    -- returns true if directory exists in absolute path to buffer number
    --function M:dir_exists(directory, bufnr)
    function M:dir_exists(directory)
        --local rel_path = vim.fn.expand(bufnr .. ':h')
        --local dir = rel_path .. '/' .. directory

        if (vim.fn.isdirectory(directory) ~= 0) then
            return true
        else
            return false
        end
    end

    -- create directory in current working directory
    --function M:make_dir(directory, bufnr)
    function M:make_dir(directory)
       --local rel_path = vim.fn.expand(bufnr .. ':h')
       --print(rel_path)
       --local dir = rel_path .. '/' .. directory
       print(directory)
       vim.fn.mkdir(directory)
    end

    function M:get_path_to_file()
        return vim.api.nvim_buf_get_name(0)
    end

    -- Returns a string of the full path to current buffer NOT including
    -- the file in the current buffer.
    --   ex.) /home/username/path/to
    function M:get_path_to_directory()
        return vim.fn.expand('%:p:h')
    end

return M
