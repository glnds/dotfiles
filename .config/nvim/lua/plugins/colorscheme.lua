return {
  -- { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
  { "sjl/badwolf", lazy = false, priority = 1000 },
  -- { "polirritmico/monokai-nightasty.nvim", lazy = false, priority = 1000 },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  -- { "ribru17/bamboo.nvim", lazy = false, priority = 1000 },

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "moonfly",
      colorscheme = "badwolf",
    },
  },
}
