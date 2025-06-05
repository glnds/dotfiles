-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","

local opt = vim.opt

opt.colorcolumn = "100" -- Make it obvious where 100 characters is
opt.linebreak = true
opt.clipboard = "unnamedplus"
opt.termguicolors = true -- True color support
