return {
  {
    'copilotlsp-nvim/copilot-lsp',
    init = function()
      vim.g.copilot_nes_debounce = 500
      vim.lsp.enable 'copilot_ls'
      vim.keymap.set('n', '<tab>', function()
        local _ = require('copilot-lsp.nes').walk_cursor_start_edit()
          or (require('copilot-lsp.nes').apply_pending_nes() and require('copilot-lsp.nes').walk_cursor_end_edit())
      end)
    end,
  },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader><F4>', vim.cmd.UndotreeToggle, { desc = 'UndoTree' })
    end,
  },

  {
    'saecki/crates.nvim',
    config = function()
      require('crates').setup {}
    end,
  },

  {
    'linux-cultist/venv-selector.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python',
      { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
    },
    lazy = false,
    branch = 'regexp',
    keys = {
      { ',v', '<cmd>VenvSelect<cr>' },
    },
    opts = {},
  },
}
