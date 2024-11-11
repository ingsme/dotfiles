return {
  -- {
  --   'altermo/ultimate-autopair.nvim',
  --   event = { 'InsertEnter', 'CmdlineEnter' },
  --   branch = 'v0.6', --recommended as each new version will have breaking changes
  --   opts = {},
  -- },
  {
    'windwp/nvim-autopairs',
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function()
      local npairs = require('nvim-autopairs')
      local endwise = require('nvim-autopairs.ts-rule').endwise
      npairs.setup({
        disable_filetype = { 'TelescopePrompt', 'vim' },
      })

      npairs.add_rules({
        endwise('then$', 'end', 'lua', 'if_statement'),
        endwise('function.*%(.*%)$', 'end', 'lua', { 'function_declaration', 'local_function', 'function' }),
      })
    end,
  },
}
