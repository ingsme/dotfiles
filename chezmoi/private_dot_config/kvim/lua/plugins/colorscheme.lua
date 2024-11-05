return {
  {
    'ramojus/mellifluous.nvim',
    priority = 1000,
    lazy = true,
    -- config = function()
    --   require('mellifluous').setup {
    --     colorset = 'tender',
    --   }
    --   vim.cmd.colorscheme 'mellifluous'
    -- end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    -- lazy = true,
    config = function()
      -- vim.cmd 'colorscheme rose-pine'
      -- vim.cmd("colorscheme rose-pine-main")
      vim.cmd 'colorscheme rose-pine-moon'
      -- vim.cmd("colorscheme rose-pine-dawn")|
    end,
  },
  {
    '0xstepit/flow.nvim',
    priority = 1000,
    opts = {},
    lazy = true,
    -- config = function()
    --   vim.cmd.colorscheme 'flow'
    -- end,
  },
  {
    'roobert/palette.nvim',
    lazy = true,
    priority = 1000,
    -- config = function()
    --   require('palette').setup {
    --     palettes = {
    --       main = 'dark',
    --       accent = 'bright',
    --       state = 'bright',
    --     },
    --   }
    --   vim.cmd 'colorscheme palette'
    -- end,
  },
  {
    'Iron-E/nvim-highlite',
    version = '^4.0.0',
    priority = 1000,
    -- config = function(_, opts)
    -- OPTIONAL: setup the plugin. See "Configuration" for information
    -- require('highlite').setup {generator = {plugins = {vim = false}, syntax = false}}
    -- end,

    lazy = true,
    -- config = function()
    --   vim.cmd.colorscheme 'highlite'
    -- end,
  },
  {
    'AlexvZyl/nordic.nvim',
    priority = 1000,
    lazy = true,
    -- config = function()
    --   vim.cmd.colorscheme 'nordic'
    -- end,
  },
  {
    'sainnhe/sonokai',
    priority = 1000,
    lazy = true,
    -- config = function()
    --   vim.cmd.colorscheme 'sonokai'
    -- end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    lazy = true,
    -- config = function()
    --   vim.cmd.colorscheme 'kanagawa-wave'
    -- end,
    opts = {},
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    lazy = true,
    -- init = function()
    --   vim.cmd.colorscheme 'nightfox'
    -- end,
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    lazy = true,
    -- init = function()
    --   vim.cmd.colorscheme 'onedark'
    -- end,
    -- opts = {
    --   style = 'deep',
    -- },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = true,
    -- init = function()
    --   vim.cmd.colorscheme 'catppuccin'
    -- end,
    opts = {
      flavour = 'mocha',
      -- integrations = {
      --   cmp = true,
      --   mason = true,
      --   neotree = true,
      --   lsp_trouble = true,
      --   which_key = true,
      -- },
      -- color_overrides = {
      --   mocha = {
      --     base = '#000000',
      --     mantle = '#000000',
      --     crust = '#000000',
      --   },
      -- },
    },
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    lazy = true,
    -- init = function()
    --   vim.cmd.colorscheme 'tokyonight-night'
    -- end,
  },
}
