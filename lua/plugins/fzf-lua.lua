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
                preview_layout = 'horizontal',
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
            },
            live_grep = {
                prompt = '󰈸 Grep > ',
            },
            buffers = {
                prompt = '󰋋 Buffers > ',
            },
            oldfiles = {
                prompt = '󱂬 History > ',
            },
            blines = {
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
                ["alt-i"] = require('fzf-lua.actions').toggle_ignore,
                ["alt-h"] = require('fzf-lua.actions').toggle_hidden,
                ["alt-f"] = require('fzf-lua.actions').toggle_follow,
            },
        }

        -- Keymaps for fzf-lua commands
        -- These should be defined AFTER fzf.setup()

        -- Keymaps for finding files or things
        vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Fuzzy find files' })
        vim.keymap.set('n', '<leader>fc', function() fzf.files({ cwd = vim.fn.stdpath("config")}) end, { desc = 'Config files' })
        vim.keymap.set('n', '<leader>fn', function() require('fzf-lua').files({ cwd = vim.fn.expand('~/notes') }) end, { desc = 'Find files in notes' })
        vim.keymap.set('n', '<leader>fA', function() require('fzf-lua').files({ cwd = vim.fn.expand('~') }) end, { desc = 'Find files under ~' })

        -- keymaps for searching within something
        vim.keymap.set('n', '<leader>sw', fzf.grep_cword, { desc = 'Search for word or selection in cwd' })
        vim.keymap.set('x', '<leader>sw', fzf.grep_visual, { desc = 'Search for word or selection in cwd' })
        vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = 'Live grep cwd' })
        vim.keymap.set('n', '<leader>sh', fzf.manpages, { desc = 'Search help pages' })
        vim.keymap.set('n', '<leader>sl', fzf.blines, { desc = 'Search in file with preview' })
        vim.keymap.set('n', '<leader>sd', function() require('utils.fzf_custom').live_grep_in_selected_dir() end, { desc = 'Search specific dir' })
        vim.keymap.set('n', '<leader>sn', function() require('fzf-lua').live_grep({ cwd = vim.fn.expand('~/notes') }) end, { desc = 'Grep in notes' })
        vim.keymap.set('n', '<leader>sA', function() require('fzf-lua').live_grep({ cwd = vim.fn.expand('~') }) end, { desc = 'Grep within all files under ~' })

        -- misc
        vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = 'Resume previous search' })
        vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = 'Keymaps' })
        vim.keymap.set('n', '<leader>,', function() fzf.buffers({ sort_mru = true, sort_lastused = true}) end, { desc = 'Fuzzy find buffers' })

        -- git related searching
        vim.keymap.set('n', '<leader>fgf', fzf.git_files, { desc = 'git files' })
        vim.keymap.set('n', '<leader>fgs', fzf.git_status, { desc = 'git status' })
        vim.keymap.set('n', '<leader>fgc', fzf.git_commits, { desc = 'git commits' })
        vim.keymap.set('n', '<leader>fgb', fzf.git_bcommits, { desc = 'git buffer commits' })
        vim.keymap.set('n', '<leader>fgv', fzf.git_branches, { desc = 'git branches' })
        vim.keymap.set('n', '<leader>fgh', fzf.git_hunks, { desc = 'git hunks' })

        print 'fzf-lua configuration loaded!'
    end,
}
