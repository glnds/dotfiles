return {
  "alexghergh/nvim-tmux-navigation",
  keys = {
    { "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>" },
    { "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>" },
    { "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>" },
    { "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>" },
  },
  opts = {
    disable_when_zoomed = true,
  },
}
