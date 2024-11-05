return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treeitter** module to be loaded in time.
      -- Luckily, the only thins that those plugins need are the custom queries, which we make available
      -- during startup.
      require('lazy.core.loader').add_to_rtp(plugin)
      require 'nvim-treesitter.query_predicates'
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'windwp/nvim-ts-autotag',
      'RRethy/nvim-treesitter-endwise',
    },
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
      auto_install = true,
      endwise = {
        enable = true,
      },
      ensure_installed = 'all',
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = { query = '@function.outer', desc = 'Select outer part of a function' },
            ['if'] = { query = '@function.inner', desc = 'Select inner part of a function' },
            ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
            ['ic'] = { query = '@class.inner', desc = 'Select inner part og a class' },
            ['al'] = { query = '@loop.outer', desc = 'Select outer loop' },
            ['il'] = { query = '@loop.inner', desc = 'Select inner loop' },
            ['ap'] = { quesy = '@parameter.outer', desc = 'Select outer parameter' },
            ['ip'] = { quesy = '@parameter.inner', desc = 'Select inner parameter' },
          },
        },
      },
    },
  },
  {
    'windwp/nvim-ts-autotag',
    lazy = true,
    opts = {},
  },
}
