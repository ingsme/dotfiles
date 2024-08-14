return {
  {
    'folke/trouble.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
      -- stylua: ignore
      {"<leader>xx", function() require("trouble").toggle() end, desc = "Toggle trouble"},
      {
        '<leader>xw',
        function()
          require('trouble').toggle('workspace_diagnostics')
        end,
        desc = 'Trouble Workspace diagnostics',
      },
      {
        '<leader>xd',
        function()
          require('trouble').toggle('document_diagnostics')
        end,
        desc = 'Trouble document diagnistics',
      },
      {
        '<leader>xq',
        function()
          require('trouble').toggle('quickfix')
        end,
        desc = 'Trouble toggle quickfix',
      },
      {
        '<leader>xl',
        function()
          require('trouble').toggle('loclist')
        end,
        desc = 'Trouble loclist',
      },
      {
        'gR',
        function()
          require('trouble').toggle('lsp_references')
        end,
        desc = 'Trouble lsp references',
      },
      {
        '<leader>xn',
        function()
          if require('trouble').is_open() then
            require('trouble').next({ skip_groups = true, jump = true })
          end
        end,
        desc = 'Trouble next item',
      },
      {
        '<leader>xp',
        function()
          if require('trouble').is_open() then
            require('trouble').previous({ skip_groups = true, jump = true })
          end
        end,
        desc = 'Trouble previous item',
      },
    },
  },
}
