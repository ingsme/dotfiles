return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- event = {
  --   'BufReadPre ' .. vim.fn.expand('~') .. '/Documents/obsidian/**/**.md',
  --   'BufNewFile ' .. vim.fn.expand('~') .. '/Documents/obsidian/**/**.md',
  -- },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'Vault42',
        path = '~/Documents/obsidian/Vault42',
      },
    },
    notes_subdir = 'inbox',
    new_notes_location = 'notes_subdir',
    templates = {
      subdir = 'templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
    },
    mappings = {
      -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- toggle check-boxes
      -- ["<leader>ch"] = {
      --   action = function()
      --     return require("obsidian").util.toggle_checkbox()
      --   end,
      --   opts = { buffer = true },
      -- },
    },
  },
}
