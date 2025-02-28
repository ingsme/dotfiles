local map = vim.keymap.set
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Add undo break-points
map("i", ",", ",<c-g>u", {})
map("i", ".", ".<c-g>u", {})
map("i", ";", ";<c-g>u", {})

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Aliasing vim motions
map("o", "ir", "i[")
map("o", "ar", "a[")
map("o", "ia", "i<")
map("o", "aa", "a<")
