-- Neovim Core Settings
require("settings")

-- Helper functions and autocommands
--require("functions")
--require("autocommands")
--require("commands")

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup("plugins", {
  change_detection = {
    enabled = true,
    notify = false,
  },
})

--require("options")
require("setup.spelling")

-- Mappings
require("mappings")

-- Language Servers
require("lsp")
