return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    keys = {
      { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Neotree' },
      { '<leader>gs', '<cmd>Neotree float git_status<cr>', desc = 'Neotree Git status' },
    },
    opts = {
      -- enable_git_status = true,
      -- enable_diagnostics = true,
      -- event_handlers = {
      --   event = 'file_opened',
      --   handler = function()
      --     require('neo-tree').close_all()
      --   end,
      -- },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
        },
      },
    },
  },
}
