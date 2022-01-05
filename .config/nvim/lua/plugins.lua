-- https://github.com/wbthomason/packer.nvim

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
vim.api.nvim_command("packadd packer.nvim")
-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
  return string.format('require("setup/%s")', name)
end

return require("packer").startup({
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        -- Legacy
        use 'tpope/vim-fugitive'
        use 'airblade/vim-gitgutter'
        use 'tpope/vim-vinegar'
        -- use 'itchyny/lightline.vim'
        use 'benmills/vimux'
        use 'christoomey/vim-tmux-navigator'
        use {'iamcco/markdown-preview.nvim', run = 'cd app & yarn install' }
        use 'ap/vim-buftabline'
        use {'fatih/vim-go', run = ':GoInstallBinaries' }
        use 'sjl/badwolf'

        -- Lua
        use({ "tpope/vim-repeat" })
        use({ "tpope/vim-commentary" })
        use({ "tpope/vim-surround" })
        use({
            "nvim-lualine/lualine.nvim",
            config = get_setup("lualine"),
            event = "VimEnter",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
        })
        use({
            "nvim-treesitter/nvim-treesitter",
            config = get_setup("treesitter"),
            run = ":TSUpdate",
            requires = {
                { "p00f/nvim-ts-rainbow" },
            },
        })
        use("nvim-treesitter/nvim-treesitter-textobjects")
        use({
            "norcalli/nvim-colorizer.lua",
            event = "BufReadPre",
            config = get_setup("colorizer"),
        })
        use({
            "nvim-telescope/telescope.nvim",
            module = "telescope",
            cmd = "Telescope",
            requires = {
                { "nvim-lua/popup.nvim" },
                { "nvim-lua/plenary.nvim" },
                { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
                { "kyazdani42/nvim-web-devicons" },
            },
            config = get_setup("telescope"),
        })
        use({ "nvim-telescope/telescope-file-browser.nvim" })
        -- LSP
        use({ "neovim/nvim-lspconfig", config = get_setup("lsp") })
        -- use 'jose-elias-alvarez/null-ls.nvim'
        -- Autocomplete
        use({
            "hrsh7th/nvim-cmp",
            requires = {
                { "hrsh7th/cmp-nvim-lsp" },
                { "hrsh7th/cmp-nvim-lua" },
                { "hrsh7th/cmp-buffer" },
                { "hrsh7th/cmp-path" },
                { "hrsh7th/cmp-cmdline" },
                { "hrsh7th/vim-vsnip" },
                { "hrsh7th/cmp-vsnip" },
                { "hrsh7th/vim-vsnip-integ" },
                { "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" } },
            },
            config = get_setup("cmp"),
        })
        use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })

        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    config = {
        display = {
            open_fn = require("packer.util").float,
        },
        profile = {
            enable = true,
            threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
        },
    },
})
