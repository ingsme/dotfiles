return {
  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
    enabled = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<Cr>', desc = 'Lazygit' },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gb', ':Git blame<CR>', desc = 'Git blame' },
    },
  },
}
