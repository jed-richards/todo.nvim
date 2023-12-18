# todo.nvim

## What Is todo.nvim?

`todo.nvim` is a project wide todo list within Neovim.

## Table of Contents

- [Getting Started](#getting-started)
- [Usage](#usage)

## Getting Started

This section will show how to install `todo.nvim` within using Lazy as a 
package manager.

### Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
-- init.lua:
{
    'jed-richards/todo.nvim'
}

-- plugins/todo.lua:
return {
    'jed-richards/todo.nvim'
}
```

## Usage

After installation, `todo.nvim` will be setup and ready to be used. 

### Default Mappings
| Mappings       | Action                                               |
|----------------|------------------------------------------------------|
| `<leader>td`   | Toggle todo window                                   |
| `<C-a>`        | Add item (within todo window)                        |
| `<C-x>`        | Remove item under cursor (within todo window)        |
| `<cr>`         | Toggle/mark item under cursor (within todo window)   |
| `q`            | Close/quit todo window (within todo window)          |
| `h`            | Toggle todo help window (within todo window)         |

### How does it work? 

`todo.nvim` uses the user's CWD as the base of the "project". Therefore, the 
user will start `nvim` within the directory that will be their "base" or 
"root". `todo.nvim` will create a directory under the CWD as `.todo/`. This will
store the user's TODOs.
