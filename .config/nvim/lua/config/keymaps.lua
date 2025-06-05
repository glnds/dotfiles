-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local lazyvim_util = require("lazyvim.util")

local set = vim.keymap.set
local del = vim.keymap.del

-- Disables
del("n", "<leader>,")
del("n", "<Leader><Space>")
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")

-- Custom Key Mappings
set({ "i" }, "jj", "<Esc>", { desc = "Remap Escape to jj in insert mode" })

set({ "n" }, "<Leader><Leader>", "V|", { desc = "Enter Visual Mode" })
-- set({ "n" }, "<Leader>f", "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "Find Files (Root Dir)" })
-- set({ "n" }, "<Leader><Space>", "<cmd>lua require('telescope.builtin').buffers()<cr>", { desc = "Switch Buffer" })

set({ "v" }, "<Leader>c", '"+y', { desc = "Copy" })
set({ "n" }, "<Leader>v", '"+p', { desc = "Pase" })

set({ "n" }, "x", '"_x', { desc = "Delete to Black Hole register" })
set({ "n" }, "X", '"_X', { desc = "Delete to Black Hole register" })

set({ "n" }, "<Leader>w", "<cmd>:w<CR>", { desc = "Easier File save" })

set({ "n" }, "<S-Enter", "O<esc>", { desc = "Insert newline on Enter in normal mode" })
set({ "n" }, "<CR>", "o<esc>", { desc = "Insert newline on Enter in normal mode" })

set({ "n" }, "<left>", "<nop>", { desc = "Disabling arrow keys in normal mode" })
set({ "n" }, "<up>", "<nop>", { desc = "Disabling arrow keys in normal mode" })
set({ "n" }, "<right>", "<nop>", { desc = "Disabling arrow keys in normal mode" })
set({ "n" }, "<down>", "<nop>", { desc = "Disabling arrow keys in normal mode" })
set({ "i" }, "<left>", "<nop>", { desc = "Disabling arrow keys in insert mode" })
set({ "i" }, "<up>", "<nop>", { desc = "Disabling arrow keys in insert mode" })
set({ "i" }, "<right>", "<nop>", { desc = "Disabling arrow keys in insert mode" })
set({ "i" }, "<down>", "<nop>", { desc = "Disabling arrow keys in insert mode" })

set(
  "n",
  "<C-h>",
  "<Cmd>NvimTmuxNavigateLeft<CR>",
  { desc = "Allow seamlessly navigation between vim and tmux", silent = true }
)
set(
  "n",
  "<C-j>",
  "<Cmd>NvimTmuxNavigateDown<CR>",
  { desc = "Allow seamlessly navigation between vim and tmux", silent = true }
)
set(
  "n",
  "<C-k>",
  "<Cmd>NvimTmuxNavigateUp<CR>",
  { desc = "Allow seamlessly navigation between vim and tmux", silent = true }
)
set(
  "n",
  "<C-l>",
  "<Cmd>NvimTmuxNavigateRight<CR>",
  { desc = "Allow seamlessly navigation between vim and tmux", silent = true }
)
set(
  "n",
  "<C-\\>",
  "<Cmd>NvimTmuxNavigateLastActive<CR>",
  { desc = "Allow seamlessly navigation between vim and tmux", silent = true }
)
set(
  "n",
  "<C-Space>",
  "<Cmd>NvimTmuxNavigateNavigateNext<CR>",
  { desc = "Allow seamlessly navigation between vim and tmux", silent = true }
)
