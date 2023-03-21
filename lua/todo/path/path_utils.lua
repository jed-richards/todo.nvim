local M = {}

    -- returns true if directory exists in absolute path to buffer number
    function M.dir_exists(directory, bufnr)
        local rel_path = vim.fn.expand(bufnr .. ':h')
        local dir = rel_path .. '/' .. directory

        if (vim.fn.isdirectory(dir) ~= 0) then
            return true
        else
            return false
        end
    end

    -- create directory in current working directory
   function M.make_dir(directory, bufnr)
       local rel_path = vim.fn.expand(bufnr .. ':h')
       local dir = rel_path .. '/' .. directory
       vim.fn.mkdir(dir)
   end

return M
