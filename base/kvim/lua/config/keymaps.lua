-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- correct spelling mistakes in insert-mode with ctrl-l
map("i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>ua", {})
map("i", "jk", "<Esc>l", {})
