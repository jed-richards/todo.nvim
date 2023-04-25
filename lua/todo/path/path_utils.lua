local M = {}

-- returns true if directory name exists (path dependent on directory name)
function M:dir_exists(directory)
  if (vim.fn.isdirectory(directory) ~= 0) then
    return true
  else
    return false
  end
end

-- create directory (path dependent on directory name)
function M:make_dir(directory)
  vim.fn.mkdir(directory)
end

-- Returns the absolute path to the file in the current buffer
--  ex.) /home/username/path/to/file.txt
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
