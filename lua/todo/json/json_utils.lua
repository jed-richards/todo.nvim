local M = {}

-- Encodes a lua table into a json string
function M.encode(obj)
  return vim.json.encode(obj)
end

-- Decodes a json string into a lua table
function M.decode(obj)
  return vim.json.decode(obj)
end

return M
