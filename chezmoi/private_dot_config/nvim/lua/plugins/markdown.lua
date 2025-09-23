return {
  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup()
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },
  -- {
  --   'brianhuster/live-preview.nvim',
  --   dependencies = {
  --     'ibhagwan/fzf-lua',
  --   },
  -- },
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    priority = 49,
    dependencies = {
      'saghen/blink.cmp',
    },
  },
}
