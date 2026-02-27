return {
  "greggh/claude-code.nvim",
  cmd = { "ClaudeCode", "ClaudeCodeChat", "ClaudeCodeTreeAdd" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("claude-code").setup()
  end,
}
