return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      markdown = { "markdownlint-cli2" },
    },
    linters = {
      ["markdownlint-cli2"] = {
        args = {
          "--config",
          vim.fn.expand("~/.markdownlint.yaml"),
          "--",
        },
      },
    },
  },
}
