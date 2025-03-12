return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      columns = {
        "icon",
        "permissions",
        "size",
      },
      skip_confirm_for_simple_edits = true,
      win_options = {
        signcolumn = "yes:2",
      },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    keys = {
      { "-", "<cmd>Oil<cr>", { desc = "Open parent directory" } },
    },
  },
}
