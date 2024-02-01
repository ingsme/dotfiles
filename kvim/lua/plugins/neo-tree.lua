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
      event_handlers = {
        event = 'file_opened',
        handler = function(file_path)
          require('neo-tree.command').execute({ action = 'close' })
        end,
      },
    },
  },
}
