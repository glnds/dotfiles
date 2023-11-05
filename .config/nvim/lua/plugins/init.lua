
return {
  {
    "tpope/vim-commentary",
    "tpope/vim-fugitive",
    "tpope/vim-surround",
    "lewis6991/gitsigns.nvim",
    "nvim-lualine/lualine.nvim",
    "christoomey/vim-tmux-navigator",
  },
}





--  use({
--    "nvim-lualine/lualine.nvim",
--    config = get_setup("lualine"),
--    event = "VimEnter",
--    requires = { "kyazdani42/nvim-web-devicons", opt = true },
--  })
--  use("p00f/nvim-ts-rainbow")
--  use({
--    "nvim-treesitter/nvim-treesitter",
--    config = get_setup("treesitter"),
--    run = ":TSUpdate",
--  })
--  use("nvim-treesitter/nvim-treesitter-textobjects")
--  use({
--    "norcalli/nvim-colorizer.lua",
--    config = get_setup("colorizer"),
--    event = "BufReadPre",
--  })







--  use("github/copilot.vim")
--  use("christoomey/vim-tmux-navigator")
--  use({ "iamcco/markdown-preview.nvim", run = "cd app & yarn install" })
--  use("ap/vim-buftabline")
--  use({ "fatih/vim-go", run = ":GoInstallBinaries" })
--  use({ "kyazdani42/nvim-web-devicons", config = get_setup("web-devicons") })
--  -- Lua
--  -- Styling and Colors
--  use({ "lukas-reineke/indent-blankline.nvim", config = get_setup("indent-blankline") })
--  use({
--    "nvim-telescope/telescope.nvim",
--    config = get_setup("telescope"),
--    module = "telescope",
--    cmd = "Telescope",
--    requires = {
--      { "nvim-lua/popup.nvim" },
--      { "nvim-lua/plenary.nvim" },
--      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
--      { "kyazdani42/nvim-web-devicons" },
--    },
--  })
--	use({ "nvim-telescope/telescope-file-browser.nvim" })
--	-- LSP
--	use("williamboman/mason.nvim")                              -- Manage external editor tooling
--	use("williamboman/mason-lspconfig.nvim")                    -- Bridges mason and the lspconfig plugin
--	use({ "neovim/nvim-lspconfig", config = get_setup("lsp") }) -- Configurations for nvim LSP
--	use("mfussenegger/nvim-dap")                                -- Debug Adapter Protocol client
--	use("jose-elias-alvarez/null-ls.nvim")                      -- Inject LSP diagnostics, code actions, and more
--  -- Rust
--  use 'simrat39/rust-tools.nvim'
--	-- Autocomplete
--	use({
--		"hrsh7th/nvim-cmp",
--		config = get_setup("cmp"),
--		requires = {
--			{ "hrsh7th/cmp-nvim-lsp" },
--			{ "hrsh7th/cmp-buffer" }, -- Buffer completions
--			{ "hrsh7th/cmp-path" }, -- Path completions
--			{ "hrsh7th/cmp-nvim-lua" },
--			{ "hrsh7th/cmp-cmdline" }, -- Cmdline completions
--			{ "saadparwaiz1/cmp_luasnip" }, -- Snippet completions
--			{ "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" } },
--		},
--	})
--	-- Snippets
--	use("L3MON4D3/LuaSnip") -- Snippet engine
--	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
--
--	use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })
--	use({
--		"folke/trouble.nvim",
--		config = get_setup("trouble"),
--		requires = { "kyazdani42/nvim-web-devicons", opt = true },
--	})
--	use({
--		"kyazdani42/nvim-tree.lua",
--		config = get_setup("nvim-tree"),
--		requires = { "kyazdani42/nvim-web-devicons" },
--	})
--	use({
--		"phaazon/hop.nvim",
--		config = get_setup("hop"),
--		branch = "v1", -- optional but strongly recommended
--	})
--	use({
--		"simrat39/symbols-outline.nvim",
--		config = get_setup("outline"),
--	})
--end)
