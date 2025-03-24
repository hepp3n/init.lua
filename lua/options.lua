require "nvchad.options"

-- add yours here!

vim.o.relativenumber = true

vim.o.scrolloff =  10

-- Save undo history
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv 'HOME' .. '/.nvim/undodir'


-- local o = vim.o
vim.o.cursorlineopt ='both' -- to enable cursorline!
