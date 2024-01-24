return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-media-files.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    -- stylua: ignore
    keys = {
      { '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = 'Find files' },
      { '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = 'Grep' },
      { '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = 'Buffers' },
      { '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = 'Help tags' },
      { 'gd', function() require('telescope.builtin').lsp_definitions({ reuse_win = true }) end, desc = '[g]oto [d]efinition', },
      { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
      { "gD", vim.lsp.buf.declaration, desc = "[g]oto [D]eclaration" },
      { "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "[g]oto [I]mplementation" },
      { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "[g]oto T[y]pe Definition" },
      { "K", vim.lsp.buf.hover, desc = "Hover" },
      { '<leader>F', vim.lsp.buf.format({async = true}), desc = 'Format' },
      { "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
      { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
      {
        "<leader>cA",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "source",
              },
              diagnostics = {},
            },
          })
        end,
        desc = "Source Action",
      }
    },
  },
}
