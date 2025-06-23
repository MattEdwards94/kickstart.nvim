--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.g.have_nerd_font = true

vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

vim.opt.rtp:prepend(vim.fn.stdpath 'data' .. '/lua')

require 'options'

-- ========================= [[ Basic Autocommands ]] ========================= --
--  See `:help lua-guide-autocommans`

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- ========================= [[ Install `lazy.nvim` plugin manager ]] ========================= --
--Install `lazy.nvim` plugin manager
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
vim.opt.rtp:prepend(lazypath)
vim.opt.rtp:prepend(vim.fn.stdpath 'data' .. '/lua')

-- ========================= [ Configure and install plugins ] ========================= --
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({

  { import = 'plugins' },

  -- Detect tabstop and shiftwidth automatically
  'NMAC427/guess-indent.nvim',
  -- auto save files
  'Pocco81/auto-save.nvim',
  -- Allow bookmarking lines of code more easily
  'MattesGroeger/vim-bookmarks',


  -- { -- Autoformat
  --   'stevearc/conform.nvim',
  --   event = { 'BufWritePre' },
  --   cmd = { 'ConformInfo' },
  --   keys = {
  --     {
  --       '<leader>f',
  --       function()
  --         require('conform').format { async = true, lsp_format = 'fallback' }
  --       end,
  --       mode = '',
  --       desc = '[F]ormat buffer',
  --     },
  --   },
  --   opts = {
  --     notify_on_error = false,
  --     format_on_save = function(bufnr)
  --       -- Disable "format_on_save lsp_fallback" for languages that don't
  --       -- have a well standardized coding style. You can add additional
  --       -- languages here or re-enable it for the disabled ones.
  --       local disable_filetypes = { c = true, cpp = true }
  --       if disable_filetypes[vim.bo[bufnr].filetype] then
  --         return nil
  --       else
  --         return {
  --           timeout_ms = 500,
  --           lsp_format = 'fallback',
  --         }
  --       end
  --     end,
  --     formatters_by_ft = {
  --       lua = { 'stylua' },
  --       -- Conform can also run multiple formatters sequentially
  --       -- python = { "isort", "black" },
  --       --
  --       -- You can use 'stop_after_first' to run the first available formatter from the list
  --       -- javascript = { "prettierd", "prettier", stop_after_first = true },
  --     },
  --   },
  -- },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },


  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },

  },

}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

require 'keymaps'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
