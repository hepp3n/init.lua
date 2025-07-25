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
