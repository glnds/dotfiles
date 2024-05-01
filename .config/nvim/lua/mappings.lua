require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- `jj` is much better :)
map("i", "jj", "<ESC>")
-- Visual mode
map("n", "<Leader><Leader>", "V|")

map("n", '<Leader>t','<cmd>lua require("nvterm.terminal").toggle("horizontal")<cr>')

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
