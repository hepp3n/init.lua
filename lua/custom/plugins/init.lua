-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('cyberdream').setup {
        transparent = true,
      }

      vim.cmd 'colorscheme cyberdream'
    end,
  },
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   config = function()
  --     require('rose-pine').setup {
  --       variant = 'moon', -- auto, main, moon, or dawn
  --       dark_variant = 'moon', -- main, moon, or dawn
  --
  --       styles = {
  --         bold = true,
  --         italic = true,
  --         transparency = true,
  --       },
  --     }
  --
  --     vim.cmd 'colorscheme rose-pine-moon'
  --   end,
  -- },
  {
    'copilotlsp-nvim/copilot-lsp',
    init = function()
      vim.g.copilot_nes_debounce = 500
      vim.lsp.enable 'copilot_ls'
      vim.keymap.set('n', '<tab>', function()
        -- Try to jump to the start of the suggestion edit.
        -- If already at the start, then apply the pending suggestion and jump to the end of the edit.
        local _ = require('copilot-lsp.nes').walk_cursor_start_edit()
          or (require('copilot-lsp.nes').apply_pending_nes() and require('copilot-lsp.nes').walk_cursor_end_edit())
      end)
    end,
  },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle, { desc = 'UndoTree' })
    end,
  },

  {
    'tpope/vim-fugitive',
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
      'mfussenegger/nvim-dap-python', --optional
      { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
    },
    lazy = false,
    branch = 'regexp', -- This is the regexp branch, use this for the new version
    keys = {
      { ',v', '<cmd>VenvSelect<cr>' },
    },
    ---@type venv-selector.Config
    opts = {
      -- Your settings go here
    },
  },
}
