return {
  {
    'NvChad/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
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
    'code-biscuits/nvim-biscuits',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = true,
  },
  {
    'eandrju/cellular-automaton.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>fml', '<Cmd>CellularAutomaton make_it_rain<CR>', desc = 'Make it rain!' },
    },
  },
  {
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
  {
    'nat-418/boole.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      mappings = {
        increment = '<C-a>',
        decrement = '<C-x>',
      },
      additions = {
        { 'man', 'tir', 'ons', 'tor', 'fre', 'lør', 'søn' },
        { 'jan', 'feb', 'mar', 'apr', 'mai', 'jun', 'jul', 'aug', 'sep', 'okt', 'nov', 'des' },
        {
          'januar',
          'februar',
          'mars',
          'april',
          'mai',
          'juni',
          'juli',
          'august',
          'september',
          'oktober',
          'november',
          'desember',
        },
      },
    },
  },
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    keys = {
      { '<Leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Undo Tree' },
    },
  },
  {
    'LunarVim/bigfile.nvim',
    event = { 'BufReadPre' },
    opts = {},
  },
}
