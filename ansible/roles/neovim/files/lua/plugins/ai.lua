return {
  {
    'Exafunction/codeium.nvim',
    event = 'InsertEnter',
    build = ':Codeium Auth',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('codeium').setup({})
    end,
  },
}
