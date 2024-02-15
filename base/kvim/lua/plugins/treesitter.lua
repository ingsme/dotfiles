return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'VeryLazy',
    -- event = { 'BufReadPre', 'BufNewFile' },
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treeitter** module to be loaded in time.
      -- Luckily, the only thins that those plugins need are the custom queries, which we make available
      -- during startup.
      require('lazy.core.loader').add_to_rtp(plugin)
      require('nvim-treesitter.query_predicates')
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-refactor',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'RRethy/nvim-treesitter-textsubjects',
      'windwp/nvim-ts-autotag',
      'RRethy/nvim-treesitter-endwise',
    },
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    opts = {
      ensure_installed = 'all',
      -- ensure_installed = {
      --   'cmake',
      --   'diff',
      --   'git_config',
      --   'git_rebase',
      --   'gitattributes',
      --   'gitcommit',
      --   'gitignore',
      --   'go',
      --   'jq',
      --   'json5',
      --   'latex',
      --   'lua',
      --   'make',
      --   'norg',
      --   'puppet',
      --   'python',
      --   'query',
      --   'r',
      --   'regex',
      --   'ruby',
      --   'rust',
      --   'sql',
      --   'swift',
      --   'vim',
      --   'vimdoc',
      --   'yaml',
      -- },
      auto_install = true,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<leader>ss',
          node_incremental = '<leader>si',
          scope_incremental = '<leader>sc',
          node_decremental = '<leader>sd',
        },
      },
      autopairs = { enabled = true },
      autotag = { enabled = true },
      endwise = { enabled = true },
      indent = { enabled = true },
      highlight = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
            -- You can also use captures from other query groups like `locals.scm`
            ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
          },
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          include_surrounding_whitespace = true,
        },
      },
    },
    config = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'nvim-ts-context-commentstring',
    lazy = true,
    opts = {
      languages = {
        puppet = '# %s',
      },
    },
  },
}
