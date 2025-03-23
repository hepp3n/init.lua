require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map('n', '<space><F5>', vim.cmd.UndotreeToggle, { silent = true, desc = 'Open Undotree' })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
