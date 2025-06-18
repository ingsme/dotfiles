if true then
  return {}
end
return {
  'Vigemus/iron.nvim',
  opts = {
    repl_definition = {
      python = {
        command = { 'ipython3' },
        block_dividers = { '# %%', '#%%' },
      },
    },
    ignore_blank_lines = true,
  },
  keys = {
    toggle_repl = '<space>rr', -- toggles the repl open and closed.
    -- If repl_open_command is a table as above, then the following keymaps are
    -- available
    -- toggle_repl_with_cmd_1 = "<space>rv",
    -- toggle_repl_with_cmd_2 = "<space>rh",
    restart_repl = '<space>rR', -- calls `IronRestart` to restart the repl
    send_motion = '<space>isc',
    visual_send = '<space>isc',
    send_file = '<space>isf',
    send_line = '<space>isl',
    send_paragraph = '<space>isp',
    send_until_cursor = '<space>isu',
    send_mark = '<space>ism',
    send_code_block = '<space>isb',
    send_code_block_and_move = '<space>isn',
    mark_motion = '<space>imc',
    mark_visual = '<space>imc',
    remove_mark = '<space>imd',
    cr = '<space>s<cr>',
    interrupt = '<space>s<space>',
    exit = '<space>isq',
    clear = '<space>icl',
  },
}
