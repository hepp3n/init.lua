-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  {
    'github/copilot.vim',
    {
      {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {
          { 'nvim-lua/plenary.nvim', branch = 'master' },
        },
        build = 'make tiktoken',
        opts = {
          -- See Configuration section for options
        },
      },
    },
  },

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = true,
    config = function()
      -- Default options:
      require('gruvbox').setup {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = '', -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      }
      vim.cmd 'colorscheme gruvbox'
    end,
  },

  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      require('crates').setup()
    end,
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    'https://codeberg.org/esensar/nvim-dev-container',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('devcontainer').setup {
        -- Can be set to false to prevent generating default commands
        -- Default commands are listed below
        generate_commands = true,
        -- By default no autocommands are generated
        -- This option can be used to configure automatic starting and cleaning of containers
        autocommands = {
          -- can be set to true to automatically start containers when devcontainer.json is available
          init = false,
          -- can be set to true to automatically remove any started containers and any built images when exiting vim
          clean = false,
          -- can be set to true to automatically restart containers when devcontainer.json file is updated
          update = true,
        },
        -- can be changed to increase or decrease logging from library
        log_level = 'info',
        -- can be set to true to disable recursive search
        -- in that case only .devcontainer.json and .devcontainer/devcontainer.json files will be checked relative
        -- to the directory provided by config_search_start
        disable_recursive_config_search = false,
        -- can be set to false to disable image caching when adding neovim
        -- by default it is set to true to make attaching to containers faster after first time
        cache_images = true,
        -- By default all mounts are added (config, data and state)
        -- This can be changed to disable mounts or change their options
        -- This can be useful to mount local configuration
        -- And any other mounts when attaching to containers with this plugin
        attach_mounts = {
          neovim_config = {
            -- enables mounting local config to /root/.config/nvim in container
            enabled = true,
            -- makes mount readonly in container
            options = { 'readonly' },
          },
          neovim_data = {
            -- enables mounting local data to /root/.local/share/nvim in container
            enabled = true,
            -- no options by default
            options = {},
          },
          -- Only useful if using neovim 0.8.0+
          neovim_state = {
            -- enables mounting local state to /root/.local/state/nvim in container
            enabled = true,
            -- no options by default
            options = {},
          },
        },
        -- This takes a list of mounts (strings) that should always be added to every run container
        -- This is passed directly as --mount option to docker command
        -- Or multiple --mount options if there are multiple values
        always_mount = {
          'source=/home/hepp3n/.config/github-copilot,target=/root/.config/github-copilot,type=bind,readonly',
        },
      }
      vim.keymap.set('n', '<space><F6>', '<cmd>DevcontainerStopAll<cr>', { desc = 'Dev Container Stop All' })
      vim.keymap.set('n', '<space><F7>', '<cmd>DevcontainerStart<cr>', { desc = 'Dev Container Start' })
      vim.keymap.set('n', '<space><F8>', '<cmd>DevcontainerAttach<cr>', { desc = 'Dev Container Attach' })
    end,
  },
}
