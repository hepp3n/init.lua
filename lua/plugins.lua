vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/j-hui/fidget.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/saghen/blink.cmp" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://codeberg.org/mfussenegger/nvim-dap" },
    { src = "https://github.com/milanglacier/minuet-ai.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
})

require('gitsigns').setup({ signcolumn = false })
require('mason').setup({})
require("fidget").setup({})

require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
    keymap = {
        preset = "default",
        ["<C-space>"] = {},
        ["<C-p>"] = {},
        ["<Tab>"] = {},
        ["<S-Tab>"] = {},
        ["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-n>"] = { "select_and_accept" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_down", "fallback" },
        ["<C-f>"] = { "scroll_documentation_up", "fallback" },
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-h>"] = { "snippet_backward", "fallback" },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        }
    },

    cmdline = {
        keymap = {
            preset = "inherit",
            ["<CR>"] = { 'accept_and_enter', 'fallback' }
        }
    },

    sources = { default = { "lsp" } }

})

require("conform").setup({
    formatters = {
        "stylua",
        "rustfmt",
        "gofmt"
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})

require('minuet').setup {
    virtualtext = {
        auto_trigger_ft = { "lua", "bash", "rust", "go", "zig", "python", "javascript" },
    },
    blink = {
        enable_auto_complete = true,
    },
    provider = 'gemini',
    provider_options = {
        gemini = {
            model = 'gemini-2.5-flash', -- Use Flash for speed or Pro for accuracy
            api_key = "GEMINI_API_KEY",
            optional = {
                generationConfig = {
                    maxOutputTokens = 256,
                    -- When using `gemini-2.5-flash`, it is recommended to entirely
                    -- disable thinking for faster completion retrieval.
                    thinkingConfig = {
                        thinkingBudget = 0,
                    },
                },
                safetySettings = {
                    {
                        -- HARM_CATEGORY_HATE_SPEECH,
                        -- HARM_CATEGORY_HARASSMENT
                        -- HARM_CATEGORY_SEXUALLY_EXPLICIT
                        category = 'HARM_CATEGORY_DANGEROUS_CONTENT',
                        -- BLOCK_NONE
                        threshold = 'BLOCK_ONLY_HIGH',
                    },
                },
            },
        },
    },
}

-- telescope
local keymap = vim.keymap.set
local builtin = require('telescope.builtin')

keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
