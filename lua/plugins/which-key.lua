-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    preset = 'helix',
    -- delay between pressing a key and opening which-key (milliseconds)
    -- this setting is independent of vim.o.timeoutlen
    delay = 60,
    spec = {
      {
        mode = { 'n', 'v' },
        { '<leader>s', group = 'search' },
        { '<leader>f', group = 'file/find' },
        { '<leader>g', group = 'git' },

        { '<leader>c', group = 'code' },
        { '<leader>n', group = 'notes/neorg' },

        { '<leader>q', group = 'quit/session' },
        { '<leader>u', group = 'ui', icon = { icon = '󰙵 ', color = 'cyan' } },
        { '<leader>x', group = 'diagnostics/quickfix', icon = { icon = '󱖫 ', color = 'green' } },

        { '[', group = 'prev' },
        { ']', group = 'next' },
        { 'g', group = 'goto' },
        { 'gs', group = 'surround' },
        { 'z', group = 'fold' },

        {
          '<leader>b',
          group = 'buffer',
          expand = function()
            return require('which-key.extras').expand.buf()
          end,
        },
        {
          '<leader>w',
          group = 'windows',
          proxy = '<c-w>',
          expand = function()
            return require('which-key.extras').expand.win()
          end,
        },
      },
    },
  },
}
