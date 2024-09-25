return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      spec = {
        { '<leader>b', group = 'buffer' },
        { '<leader>c', group = 'code' },
        { '<leader>d', group = 'DAP' },
        { '<leader>f', group = 'find' },
        { '<leader>g', group = 'git' },
        { '<leader>n', group = 'neogen' },
        { '<leader>s', group = 'snippet' },
        { '<leader>sn', group = 'Noice' },
        { '<leader>x', group = 'Trouble' },
      },
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  },
}
