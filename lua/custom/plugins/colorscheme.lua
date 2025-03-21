return {
  {
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'light'

      vim.cmd.colorscheme 'rose-pine'
    end,
  },
}
