if true then
  return {}
end
return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  { 'ellisonleao/glow.nvim', config = true, cmd = 'Glow' },
  {
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { '<leader>p', '<cmd>PasteImage<cr>', desc = 'Paste image from system clipboard' },
    },
  },
  -- {
  --   'tadmccorkle/markdown.nvim',
  --   ft = 'markdown',
  --   opts = {},
  -- },
}
