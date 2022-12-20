local ok, wk = pcall(require, 'which-key')
if not ok then
    return
end

local conf = {}
wk.setup {conf}

local opts = {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local keymap = {
  b = {
    name = "Buffer",
    c = { "<Cmd>BDelete this<Cr>", "Close Buffer" },
    d = { "<Cmd>BWipeout this<Cr>", "Delete Buffer" },
    f = { "<Cmd>bdelete!<Cr>", "Force Close Buffer" },
    C = { "<Cmd>BDelete other<Cr>", "Close Other Buffers" },
    D = { "<Cmd>BWipeout other<Cr>", "Delete Other Buffers" },
    b = { "<Cmd>BufferLinePick<Cr>", "Pick a Buffer" },
    p = { "<Cmd>BufferLinePickClose<Cr>", "Pick & Close a Buffer" },
    o = { '<cmd>only<cr>', 'Only' },
  },

  f = {
    name = 'Find',
    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", 'Files' },
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help" },
    m = { "<cmd>lua require('telescope.builtin').marks()<cr>", "Marks" },
    o = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Old Files" },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
    c = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Commands" },
  },

  g = {
    name = 'Git',
    b = { "<Cmd>Git blame<cr>", 'Blame' },
  },
}

wk.register(keymap, opts)
