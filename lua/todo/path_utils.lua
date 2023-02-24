local M = {}
	-- mkdir()			create a new directory
	-- chdir()			change current working directory

    -- returns true if directory exists in absolute path to buffer number
    function M.dir_exists(directory, bufnr)
        local rel_path = vim.fn.expand(bufnr .. ':h')
        local dir = rel_path .. '/' .. directory

        print(dir)

        if (vim.fn.isdirectory(dir) ~= 0) then
            print('true')
            return 1
        else
            print('false')
            return 0
        end
    end

    -- create .todo dir in current working directory
   function M.make_dir(directory, bufnr)
       -- make dir_name
       local rel_path = vim.fn.expand(bufnr .. ':h')
       local dir = rel_path .. '/' .. directory
       vim.fn.mkdir(dir)
   end

   function M.make_file(dir, file)
        -- make file in dir
   end


return M
