return {
    'saghen/blink.cmp',
    dependencies = {
        -- Snippet Engine
        {
            'L3MON4D3/LuaSnip',
            version = '2.*',
            build = (function()
                -- Build Step is needed for regex support in snippets.
                -- This step is not supported in many windows environments.
                -- Remove the below condition to re-enable on windows.
                if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                    return
                end
                return 'make install_jsregexp'
            end)(),
            dependencies = {
                -- `friendly-snippets` contains a variety of premade snippets.
                --    See the README about individual language/framework/plugin snippets:
                --    https://github.com/rafamadriz/friendly-snippets
                -- {
                --   'rafamadriz/friendly-snippets',
                --   config = function()
                --     require('luasnip.loaders.from_vscode').lazy_load()
                --   end,
                -- },
            },
            opts = {},
        },
        'folke/lazydev.nvim',
    },
    version = '1.*',
    opts = {
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
            providers = {
                copilot = {
                    name = "copilot",
                    module = "blink-cmp-copilot",
                    kind = "Copilot",
                    score_offset = 100,
                    async = true,
                },
            },
        },
        keymap = {
            preset = 'default',
            ['<CR>'] = { 'accept', 'fallback' },
            ['<Space>'] = { 'accept', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
            ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        },
        completion = {
            accept = {
                -- experimental auto-brackets support
                auto_brackets = {
                    enabled = true,
                },
            },
            list = { selection = { preselect = false, auto_insert = false } },
            menu = {
                draw = {
                    treesitter = { 'lsp' },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
            ghost_text = {
                enabled = vim.g.ai_cmp,
            },
        },
        cmdline = {
            enabled = true,
            completion = {
                list = {
                    selection = {
                        preselect = false,
                    },
                },
                menu = {
                    auto_show = true,
                },
            },
            keymap = {
                preset = 'inherit',
                ['<CR>'] = { 'accept_and_enter', 'fallback' },
                ['<Space>'] = { 'fallback' },
            },
            sources = function()
                local type = vim.fn.getcmdtype()
                -- Search forward and backward
                if type == '/' or type == '?' then
                    return { 'buffer' }
                end
                -- Commands
                if type == ':' then
                    return { 'cmdline' }
                end
                return {}
            end,
        },
    },
}
