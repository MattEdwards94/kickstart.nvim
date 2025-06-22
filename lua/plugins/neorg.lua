return {
  'nvim-neorg/neorg',
  lazy = false,
  version = '*',
  opts = {
    load = {
      ['core.defaults'] = {},
      ['core.concealer'] = {},
      ['core.dirman'] = {
        config = {
          workspaces = {
            notes = '/home/edwardsm/notes',
          },
          default_workspace = 'notes',
          index = 'index.norg',
        },
      },
    },
  },
  run = ':Neorg sync-parsers',
}
