return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  -- ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    'BufReadPre '
      .. vim.fn.expand('~')
      .. '/Documents/obsidian/**/*.md',
    'BufNewFile ' .. vim.fn.expand('~') .. '/Documents/obsidian/**/*.md',
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = 'Vault42',
        path = '~/Documents/obsidian/Vault42/',
      },
    },
    templates = {
      folder = 'templates',
      date_format = '%Y-%m-%d-%a',
      time_format = '%H:%M',
    },

    -- see below for full list of options 👇
  },
}
