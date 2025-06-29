return {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- This function runs after fzf-lua is loaded
        local fzf = require 'fzf-lua'


        fzf.setup {
            -- Default options for various commands
            defaults = {
                border = 'rounded',
                border_chars = { '─', '│', '╭', '╮', '╯', '╰', '┤', '├' },
                previewer = 'builtin',
                preview_height = '50%',
                preview_layout = 'vertical',
                wrap_preview = true,
                bindings = {
                    ['<C-f>'] = 'half-page-down',
                    ['<C-b>'] = 'half-page-up',
                    ['<C-d>'] = 'page-down',
                    ['<C-u>'] = 'page-up',
                    ['<C-a>'] = 'beginning-of-line',
                    ['<C-e>'] = 'end-of-line',
                    ['<C-k>'] = 'kill-line',
                    ['<C-w>'] = 'unix-word-rubout',
                    ['<C-y>'] = 'yank',
                    ['<C-c>'] = 'abort',
                    ['<tab>'] = 'toggle-multiselect',
                    ['<S-tab>'] = 'toggle-sort',
                },
                file_icons = true,
                file_icon_padding = ' ',
                color_icons = true,
                git_icons = true,
            },

            -- Specific options for different fzf-lua commands
            files = {
                prompt = '󰈔 Files > ',
                cwd_prompt = true,
                actions = {
                    ["alt-i"] = { fzf.actions.toggle_ignore },
                    ["alt-h"] = { fzf.actions.toggle_hidden },
                },
            },
            live_grep = {
                prompt = '󰈸 Grep > ',
                actions = {
                    ["alt-i"] = { fzf.actions.toggle_ignore },
                    ["alt-h"] = { fzf.actions.toggle_hidden },
                },
            },
            buffers = {
                prompt = '󰋋 Buffers > ',
            },
            oldfiles = {
                prompt = '󱂬 History > ',
            },
            lines = {
                prompt = '󰋕 Lines > ',
            },
            git_files = {
                prompt = '󰊢 Git Files > ',
            },
            git_status = {
                prompt = '󰊢 Git Status > ',
            },
            git_commits = {
                prompt = '󰊢 Git Commits > ',
            },
            git_bcommits = {
                prompt = '󰊢 Buf Commits > ',
            },
            git_branches = {
                prompt = '󰊢 Branches > ',
            },

            actions = {
                ['default'] = require('fzf-lua.actions').file_edit,
                ['ctrl-s'] = require('fzf-lua.actions').file_split,
                ['ctrl-v'] = require('fzf-lua.actions').file_vsplit,
                ['ctrl-t'] = require('fzf-lua.actions').file_tabedit,
                ['ctrl-x'] = require('fzf-lua.actions').file_edit_or_qf,
                ['ctrl-q'] = require('fzf-lua.actions').file_qf,
            },
        }

        -- Keymaps for fzf-lua commands
        -- These should be defined AFTER fzf.setup()
        vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Fuzzy find files' })
        vim.keymap.set('n', '<leader>fGf', fzf.git_files, { desc = 'Git files' })
        vim.keymap.set('n', '<leader>fGs', fzf.git_status, { desc = 'Git status' })
        vim.keymap.set('n', '<leader>fGc', fzf.git_commits, { desc = 'Git commits' })
        vim.keymap.set('n', '<leader>fGb', fzf.git_bcommits, { desc = 'Git buffer commits' })
        vim.keymap.set('n', '<leader>fGv', fzf.git_branches, { desc = 'Git branches' })
        vim.keymap.set('n', '<leader>fc', function() fzf.files({ cwd = vim.fn.stdpath("config")}) end, { desc = 'Config files' })

        vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = 'Keymaps' })
        vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = 'Live Grep' })
        vim.keymap.set('n', '<leader>,', fzf.buffers, { desc = 'Fuzzy find buffers' })
        vim.keymap.set('n', '<leader>fh', fzf.oldfiles, { desc = 'Fuzzy find history' })
        vim.keymap.set('n', '<leader>fl', fzf.lines, { desc = 'Fuzzy find lines in current buffer' })
        -- vim.keymap.set('n', '<leader>ft', fzf.builtin_tags, { desc = 'Fuzzy find tags' })
        vim.keymap.set('n', '<leader>sA', function() require('utils.fzf_custom').live_grep_in_selected_dir() end, { desc = 'Search All' })

        print 'fzf-lua configuration loaded!'
    end,
}
