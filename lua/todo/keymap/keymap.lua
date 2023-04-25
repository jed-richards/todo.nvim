return {
  ['<c-x>'] = {
    func = 'remove_item(require("todo.todo").select_item())',
    desc = 'Removes the item under the cursor.'
  },
  ['<c-a>'] = {
    func = 'add_item()',
    desc = 'Adds an item to the end of your list.'
  },
  ['<cr>'] = {
    func = 'toggle_item(require("todo.todo").select_item())',
    desc = 'Marks or unmarks the item under the cursor.'
  },
  ['q'] = {
    func = 'toggle_list()',
    desc = 'Closes/Quits out of the todo list.'
  },
  ['h'] = {
    func = 'help()',
    desc = 'Opens/Closes the help window for the todo list.'
  },
}
