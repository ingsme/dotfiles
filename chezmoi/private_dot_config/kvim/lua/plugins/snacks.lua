---@diagnostic disable: undefined-doc-name
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      lazygit = { config = false },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      toggle = {},
      words = { enabled = true },
    },
    keys = {
      -- stylua: ignore start
      { '<leader>z',  function() Snacks.zen() end,                   desc = 'Toggle Zen Mode', },
      { '<leader>Z',  function() Snacks.zen.zoom() end,              desc = 'Toggle Zoom', },
      { '<leader>.',  function() Snacks.scratch() end,               desc = 'Toggle Scratch Buffer', },
      { '<leader>S',  function() Snacks.scratch.select() end,        desc = 'Select Scratch Buffer', },
      { '<leader>n',  function() Snacks.notifier.show_history() end, desc = 'Notification History', },
      { '<leader>bd', function() Snacks.bufdelete() end,             desc = 'Delete Buffer', },
      { '<leader>cR', function() Snacks.rename.rename_file() end,    desc = 'Rename File', },
      -- { '<leader>gB', function() Snacks.gitbrowse() end,             desc = 'Git Browse', mode = { 'n', 'v' }, },
      { '<leader>gB', function() Snacks.git.blame_line() end,        desc = 'Git Blame Line', },
      { '<leader>gf', function() Snacks.lazygit.log_file() end,      desc = 'Lazygit Current File History', },
      { '<leader>gg', function() Snacks.lazygit() end,               desc = 'Lazygit', },
      { '<leader>gl', function() Snacks.lazygit.log() end,           desc = 'Lazygit Log (cwd)', },
      { '<leader>un', function() Snacks.notifier.hide() end,         desc = 'Dismiss All Notifications', },
      { '<leader>ud', function() Snacks.toggle.diagnostics() end,    desc = 'Toggle diagnostics' },
      { '<leader>us', function() Snacks.toggle.option('spell') end,  desc = 'Toggle Spelling' },
      { '<leader>uw', function() Snacks.toggle.option('wrap') end,   desc = 'Toggle Wrap' },
      { '<leader>uT', function() Snacks.toggle.treesitter() end,     desc = 'Toggle Treesitter' },
      -- stylua: ignore end
    },
  },
}
