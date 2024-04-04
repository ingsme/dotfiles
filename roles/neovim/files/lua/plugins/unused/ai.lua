-- stylua: ignore
if true then return {} end
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
  -- {
  --   'jackMort/ChatGPT.nvim',
  --   event = 'VeryLazy',
  --   dependencies = {
  --     'MunifTanjim/nui.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'folke/trouble.nvim',
  --     'nvim-telescope/telescope.nvim',
  --   },
  --   opts = {
  --     api_host_cmd = 'echo https://chat.uib.no',
  --     api_key_cmd = 'echo ""',
  --   },
  -- },
}
