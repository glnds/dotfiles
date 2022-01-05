-- https://github.com/wbthomason/packer.nvim

-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
-- end

-- vim.cmd [[packadd packer.nvim]]


packer = require 'packer'
-- packer.init {}
-- packer.reset()
local use = packer.use
packer.reset()

packer.startup(function()

-- return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Legacy
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-vinegar'
    use 'itchyny/lightline.vim'
    use 'benmills/vimux'
    use 'christoomey/vim-tmux-navigator'
    use {'iamcco/markdown-preview.nvim', run = 'cd app & yarn install' }
    use 'ap/vim-buftabline'
    use {'fatih/vim-go', run = ':GoInstallBinaries' }
    use 'sjl/badwolf'
    -- use 'p00f/nvim-ts-rainbow'
    -- Lua
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'kyazdani42/nvim-web-devicons'
    -- LSP
    use 'neovim/nvim-lspconfig'
    -- Autocomplete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'

    -- use 'jose-elias-alvarez/null-ls.nvim'

    -- if packer_bootstrap then
    --     require('packer').sync()
    -- end
end)
