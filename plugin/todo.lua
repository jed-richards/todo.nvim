if vim.g.loaded_todo_list then
  return
end
vim.g.loaded_todo_list = true

vim.keymap.set(
  "n",
  "<leader>td",
  ':lua require("todo.todo").toggle_list()<CR>',
  {nowait = true, noremap = true, silent = true}
)
