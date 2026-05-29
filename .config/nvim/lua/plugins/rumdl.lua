return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rumdl = {
        cmd = { "rumdl", "server" },
        filetypes = { "markdown" },
        root_markers = { ".git" },
      },
    },
  },
}
