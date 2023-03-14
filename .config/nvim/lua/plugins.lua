-- https://github.com/wbthomason/packer.nvim

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end
vim.api.nvim_command("packadd packer.nvim")
-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
	return string.format('require("setup/%s")', name)
end

-- Plugins to track
-- https://github.com/mfussenegger/nvim-dap --DAP (Debug Adapter Protocol)

return require("packer").startup({
	function(use)
		-- Packer can manage itself
		use("wbthomason/packer.nvim")
		-- Legacy
		use("tpope/vim-fugitive")
		use("tpope/vim-vinegar")
		-- use 'itchyny/lightline.vim'
		use("benmills/vimux")
		use("christoomey/vim-tmux-navigator")
		use({ "iamcco/markdown-preview.nvim", run = "cd app & yarn install" })
		use("ap/vim-buftabline")
		use({ "fatih/vim-go", run = ":GoInstallBinaries" })
		use("sjl/badwolf")
		use({ "kyazdani42/nvim-web-devicons", config = get_setup("web-devicons") })

		-- Lua
		use({ "tpope/vim-repeat" })
		use({ "tpope/vim-commentary" })
		use({ "tpope/vim-surround" })
		use({ "nathom/filetype.nvim", config = get_setup("filetype") })
		-- Styling and Colors
		use({ "lukas-reineke/indent-blankline.nvim", config = get_setup("indent-blankline") })
		use({
			"lewis6991/gitsigns.nvim",
			config = get_setup("gitsigns"),
			requires = { "nvim-lua/plenary.nvim" },
		})
		use({
			"nvim-lualine/lualine.nvim",
			config = get_setup("lualine"),
			event = "VimEnter",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use("p00f/nvim-ts-rainbow")
		use({
			"nvim-treesitter/nvim-treesitter",
			config = get_setup("treesitter"),
			run = ":TSUpdate",
		})
		use("nvim-treesitter/nvim-treesitter-textobjects")
		use({
			"norcalli/nvim-colorizer.lua",
			config = get_setup("colorizer"),
			event = "BufReadPre",
		})
		use({
			"nvim-telescope/telescope.nvim",
			config = get_setup("telescope"),
			module = "telescope",
			cmd = "Telescope",
			requires = {
				{ "nvim-lua/popup.nvim" },
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
				{ "kyazdani42/nvim-web-devicons" },
			},
		})
		use({ "nvim-telescope/telescope-file-browser.nvim" })
		-- LSP
		use({
			"neovim/nvim-lspconfig",
			config = get_setup("lsp"),
			requires = {
				{ "b0o/schemastore.nvim" },
				{ "ray-x/lsp_signature.nvim" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig" },
				{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
				{ "jose-elias-alvarez/null-ls.nvim" },
			},
		})
		-- Autocomplete
		use({
			"hrsh7th/nvim-cmp",
			config = get_setup("cmp"),
			requires = {
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-buffer" }, -- Buffer completions
				{ "hrsh7th/cmp-path" }, -- Path completions
				{ "hrsh7th/cmp-nvim-lua" },
				{ "hrsh7th/cmp-cmdline" }, -- Cmdline completions
				{ "saadparwaiz1/cmp_luasnip" }, -- Snippet completions
				{ "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" } },
			},
		})

		-- Snippets
		use("L3MON4D3/LuaSnip") -- Snippet engine
		use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

		use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })
		use({
			"folke/trouble.nvim",
			config = get_setup("trouble"),
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use({
			"kyazdani42/nvim-tree.lua",
			config = get_setup("nvim-tree"),
			requires = { "kyazdani42/nvim-web-devicons" },
		})
		use({
			"phaazon/hop.nvim",
			config = get_setup("hop"),
			branch = "v1", -- optional but strongly recommended
		})
		use({
			"simrat39/symbols-outline.nvim",
			config = get_setup("outline"),
		})

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
	})
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	-- LSP
	use({ "neovim/nvim-lspconfig", config = get_setup("lsp") }) -- Configurations for Nvim LSP
	use("williamboman/mason.nvim")                              --  Manage external editor tooling
	use("williamboman/mason-lspconfig.nvim")                    -- Bridges mason with the lspconfig plugin
	use("mfussenegger/nvim-dap")                                --  Debug Adapter Protocol client
	use("jose-elias-alvarez/null-ls.nvim")                      -- Inject LSP diagnostics, code actions, and more
	-- Autocomplete
	-- use({
	-- 	"hrsh7th/nvim-cmp",
	-- 	config = get_setup("cmp"),
	-- 	requires = {
	-- 		{ "hrsh7th/cmp-nvim-lsp" },
	-- 		{ "hrsh7th/cmp-buffer" }, -- Buffer completions
	-- 		{ "hrsh7th/cmp-path" }, -- Path completions
	-- 		{ "hrsh7th/cmp-nvim-lua" },
	-- 		{ "hrsh7th/cmp-cmdline" }, -- Cmdline completions
	-- 		{ "saadparwaiz1/cmp_luasnip" }, -- Snippet completions
	-- 		{ "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" } },
	-- 	},
	-- })
	-- Snippets
	use("L3MON4D3/LuaSnip") -- Snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })
	use({
		"folke/trouble.nvim",
		config = get_setup("trouble"),
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"kyazdani42/nvim-tree.lua",
		config = get_setup("nvim-tree"),
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"phaazon/hop.nvim",
		config = get_setup("hop"),
		branch = "v1", -- optional but strongly recommended
	})
	use({
		"simrat39/symbols-outline.nvim",
		config = get_setup("outline"),
	})
end)
