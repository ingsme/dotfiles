return {
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6',
    opts = {},
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
  {
    'eandrju/cellular-automaton.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>fml', '<Cmd>CellularAutomaton make_it_rain<CR>', desc = 'Make it rain!' },
    },
  },
}
