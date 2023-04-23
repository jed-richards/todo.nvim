return {
  ['<c-x>'] = 'remove_item(require("todo.todo").select_item())',
  ['<c-a>'] = 'add_item()',
  ['<cr>'] = 'toggle_item(require("todo.todo").select_item())',
  --h = 'help()',
  ['q'] = 'toggle_list()',
}

--return {
--    mappings = mappings
--}
