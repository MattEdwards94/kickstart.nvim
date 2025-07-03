return {
    'pwntester/octo.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'ibhagwan/fzf-lua',
        'folke/snacks.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function ()
        require('octo').setup({
            picker = "fzf-lua",
        })
    end,
    keys = {
        {"<leader>oil", ":Octo issue list<CR>", desc = "List issues"},
        {"<leader>oip", ":Octo issue create<CR>", desc = "Create issue"},
        {"<leader>oic", ":Octo issue close<CR>", desc = "Close issue"},
        {"<leader>oid", ":Octo issue delete<CR>", desc = "Delete issue"},
        {"<leader>ois", ":Octo issue search<CR>", desc = "Search issues"},
        {"<leader>oib", ":Octo issue browser<CR>", desc = "Open issue in browser"},

        {"<leader>opl", ":Octo pr list<CR>", desc = "List PRs"},
        {"<leader>opp", ":Octo pr create<CR>", desc = "Create PR"},
        {"<leader>opc", ":Octo pr close<CR>", desc = "Close PR"},
        {"<leader>opd", ":Octo pr delete<CR>", desc = "Delete PR"},
        {"<leader>ops", ":Octo pr search<CR>", desc = "Search PRs"},

        {"<leader>ors", ":Octo review start<CR>", desc = "Open review"},
        {"<leader>orc", ":Octo review continue<CR>", desc = "Continue review"},
        {"<leader>orx", ":Octo review discard<CR>", desc = "Discard review"},
        {"<leader>orq", ":Octo review submit<CR>", desc = "Submit review"},
    }
}
