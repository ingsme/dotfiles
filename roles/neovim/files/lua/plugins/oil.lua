return {
  {
    'stevearc/oil.nvim',
    opts = {
      win_options = {
        signcolumn = 'yes:2',
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' } },
    },
  },
  {
    'refractalize/oil-git-status.nvim',
    dependencies = { 'stevearc/oil.nvim' },
    config = true,
  },
}
