return {
  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<Cr>', desc = 'Lazygit' },
    },
  },
  -- {
  -- 'tpope/vim-fugitive',
  -- cmd = 'Git',
  -- keys = {
  -- { '<leader>gb', '<Cmd>Git blame<Cr>', desc = 'Git blame' },
  -- },
  -- },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
    --[[ keys = {
          { '<leader>gb', '<Cmd>Gitsigns blame_line<Cr>', desc = 'Git blame' },
          { '<leader>gB', '<Cmd>Gitsigns toggle_current_line_blame<Cr>', desc = 'Toggle git line blame' },
        }, ]]
  },
  {
    'FabijanZulj/blame.nvim',
    cmd = 'ToggleBlame',
        -- stylua: ignore
        keys = {
          { '<leader>gb', '<cmd>ToggleBlame virtual<CR>', desc = 'Git blame' },
          { '<leader>gB', '<cmd>ToggleBlame window<CR>', desc = 'Git blame (window)' },
        },
    opts = {
      date_format = '%Y-%m-%d %H:%M',
    },
  },
}
