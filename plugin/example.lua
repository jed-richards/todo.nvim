print("hello from example.lua")

vim.keymap.set("n", "asdf", ":echo 'hello'")

vim.keymap.set("n", "<leader>td", ':lua require("todo.window").open_window()<CR>')
