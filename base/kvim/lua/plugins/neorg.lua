if true then
  return {}
end
return {
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    -- tag = "*",
    cmd = 'Neorg',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('neorg').setup({
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {
            config = {
              icon_preset = 'diamond',
              folds = false,
            },
          },
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
              },
              default_workspace = 'notes',
            },
          },
        },
      })
    end,
  },
}
