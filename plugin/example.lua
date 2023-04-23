--print("hello from example.lua")

--vim.keymap.set("n", "asdf", ":echo 'hello'")

--vim.keymap.set("n", "<leader>td", ':lua require("todo.window.window").open_window()<CR>')
vim.keymap.set(
  "n",
  "<leader>td",
  ':lua require("todo.todo").toggle_list()<CR>',
  {nowait = true, noremap = true, silent = true}
)
