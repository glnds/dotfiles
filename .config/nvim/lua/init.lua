-- Inspired by https://benfrain.com/refactor-your-neovim-init-lua-single-file-to-modules-with-packer/

vim.g.mapleader = ','

require("plugins")
require("options")
require("setup.spelling")
require("mappings")
