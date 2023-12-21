return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")

    mason.setup()

    lspconfig.pyright.setup {}
    lspconfig.tsserver.setup {}
    lspconfig.rust_analyzer.setup({})
    lspconfig.lua_ls.setup {}
    lspconfig.gopls.setup {}

    -- ...
  end,
}
