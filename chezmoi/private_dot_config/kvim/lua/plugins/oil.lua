return {
  {
    'stevearc/oil.nvim',
    opts = {
      skip_confirm_for_simple_edits = true,
      win_options = {
        signcolumn = 'yes:2',
      },
    },
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      -- {
      --   'refractalize/oil-git-status.nvim',
      --   opts = {},
      -- },
    },
    keys = {
      { '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' } },
    },
  },
}
