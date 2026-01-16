local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "

keymap("n", "<space>", "<Nop")

keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

keymap("n", "<leader>te", "<cmd>tabnew<CR>", s)

keymap("n", "<leader>_", "<cmd>vsplit<CR>", s)
keymap("n", "<leader>-", "<cmd>split<CR>", s)

keymap("t", "<Esc>", "<C-\\><C-N>")

keymap("n", "<leader>ex", "<cmd>Ex %:p:h<CR>")

local opts = { noremap = true, silent = true }
keymap("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- tmux sessionizer
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap("n", "<M-a>", "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>")

-- telescope
local builtin = require('telescope.builtin')

keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
