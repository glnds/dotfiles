-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local lazyvim_util = require("lazyvim.util")

local set = vim.keymap.set
local del = vim.keymap.del

-- Disables
del("n", "<leader>,")
del("n", "<Leader><Space>")

-- Custom Key Mappings
set({ "i" }, "jj", "<Esc>", { desc = "Remap Escape to jj in insert mode" })

set({ "n" }, "<Leader><Leader>", "V|", { desc = "Enter Visual Mode" })
set({ "n" }, "<Leader>f", "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "Find Files (Root Dir)" })
set({ "n" }, "<Leader><Space>", "<cmd>lua require('telescope.builtin').buffers()<cr>", { desc = "Switch Buffer" })

set({ "v" }, "<Leader>c", '"+y', { desc = "Copy" })
set({ "n" }, "<Leader>v", '"+p', { desc = "Pase" })

set({ "n" }, "<Leader>w", "<cmd>:w<CR>", { desc = "Easier File save" })

-- Insert newline on Enter in normal mode
set({ "n" }, "<S-Enter", "O<esc>", { desc = "Insert newline on Enter in normal mode" })
set({ "n" }, "<CR>", "o<esc>", { desc = "Insert newline on Enter in normal mode" })
