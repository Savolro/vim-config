-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<A-9>", "<cmd>diffget LO<CR>", { desc = "Diffget from LO" })
vim.keymap.set("n", "<A-0>", "<cmd>diffget RE<CR>", { desc = "Diffget from RE" })
