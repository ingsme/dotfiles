--stylua: ignore
if true then return {} end
return {
  {
    'sudormrfbin/cheatsheet.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
    opts = {},
  },
}
