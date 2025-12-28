local opt = vim.opt

vim.cmd.filetype("plugin indent on")
vim.cmd [[ colorscheme lunaperche ]]

opt.guicursor      = "i:block"
opt.colorcolumn    = "80"
opt.signcolumn     = "yes:1"
opt.termguicolors  = true
opt.ignorecase     = true
opt.swapfile       = false
opt.autoindent     = true
opt.expandtab      = true
opt.tabstop        = 4
opt.softtabstop    = 4
opt.shiftwidth     = 4
opt.shiftround     = true
opt.listchars      = "tab: ,multispace:|   ,eol:󰌑"
opt.list           = true
opt.number         = true
opt.relativenumber = true
opt.numberwidth    = 2
opt.cursorline     = true
opt.scrolloff      = 8
opt.inccommand     = "nosplit"
opt.undodir        = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile       = true
opt.completeopt    = { "menuone", "popup", "noinsert" }
opt.hlsearch       = false

vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

opt.updatetime = 250
opt.timeoutlen = 300

vim.g.netrw_liststyle = 1
vim.g.netrw_sort_by = "size"
