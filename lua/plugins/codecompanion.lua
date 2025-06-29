return {
    'olimorris/codecompanion.nvim',
    opts = {},
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    config = function()
        require('codecompanion').setup {
            strategies = {
                chat = {
                    adapter = 'gemini',
                },
                keymaps = {
                    send = {
                        modes = { n = '<C-s>', i = { '<C-s>', '<C-CR>' } },
                    },
                    close = {
                        modes = { n = '<C-c>', i = '<C-c>' },
                    },
                },
            },
            adapters = {
                gemini = function()
                    return require('codecompanion.adapters').extend('gemini', {
                        schema = {
                            model = {
                                default = 'gemini-2.0-flash',
                            },
                        },
                        env = {
                            api_key = 'GEMINI_API_KEY',
                        },
                    })
                end,
            },
        }
    end,
}
