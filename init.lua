--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.g.have_nerd_font = true

vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

vim.g.ai_cmp = true

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
  -- Allow bookmarking lines of code more easily
  'MattesGroeger/vim-bookmarks',


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
