return { 
    'Pocco81/auto-save.nvim',
    config = function()
        require('auto-save').setup({
            condition = function(buf)
                local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
                local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
                local bufname = vim.api.nvim_buf_get_name(buf)
                local fn = vim.fn
                local utils = require("auto-save.utils.data")

                -- Exclude specific filetypes from auto-save
                local excluded_filetypes = {
                    "Octo",        -- Main Octo buffers
                    "gitcommit",   -- Common exclusion for Git commit messages
                    "gitrebase",   -- Common exclusion for Git rebase messages
                    "markdown",    -- If Octo comments are markdown and you don't want to autosave them
                    -- (though Octo handles saving explicitly on :w)
                }

                for _, ft in ipairs(excluded_filetypes) do
                    if filetype == ft then
                        return false -- Don't save
                    end
                end

                -- Also exclude specific buffer names/patterns
                -- Octo buffer names often start with "github://"
                if bufname:match("^github://") then
                    return false -- Don't save
                end

                -- Check for special buffer types that are usually not saved
                -- like scratch buffers, terminals, etc.
                if buftype ~= "" and buftype ~= "nofile" then
                    return false -- buftype can be 'nofile', 'nowrite', 'quickfix', 'terminal', etc.
                    -- 'nofile' means not associated with a file, but can be written.
                    -- We generally want to exclude things like 'terminal', 'prompt', 'nofile' if they
                    -- are just temporary buffers.
                end

                if
                    fn.getbufvar(buf, "&modifiable") == 1 and
                    utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                    return true -- met condition(s), can save
                end
                return false -- can't save
            end,
        })
    end
}

