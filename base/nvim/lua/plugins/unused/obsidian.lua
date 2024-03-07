-- stylua: ignore
if true then return {} end
return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  cmd = 'ObsidianNew',
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
        name = 'vault54',
        path = '~/Documents/obsidian/vault54',
      },
      {
        name = 'work',
        path = '~/Documents/obsidian/work',
      },
      {
        name = 'recipes',
        path = '~/Documents/obsidian/recipes',
      },
    },
  },
}
