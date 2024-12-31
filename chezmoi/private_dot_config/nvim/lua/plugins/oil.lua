return {
  {
    'stevearc/oil.nvim',
    opts = {
      win_options = {
        signcolumn = 'yes:2',
      },
    },
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      -- { 'refractalize/oil-git-status.nvim', config = true },
    },
    keys = {
      { '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' } },
    },
  },
}
