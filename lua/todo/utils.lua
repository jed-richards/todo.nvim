
-- Create a Module -> This is like an object that can have functions
--                    that can be called after instantiating the
--                    variable (object). This module is a dictionary
--                    (table).
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

return M
