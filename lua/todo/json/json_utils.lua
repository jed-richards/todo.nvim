local M = {}

    function M.encode(obj)
        return vim.json.encode(obj)
    end

    function M.decode(obj)
        return vim.json.decode(obj)
    end

return M
