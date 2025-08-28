return {
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
  { "sjl/badwolf", lazy = false, priority = 1000 },
  { "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "morhetz/gruvbox", lazy = false, priority = 1000 },
  { "sainnhe/sonokai", lazy = false, priority = 1000 },

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      -- colorscheme = "sonokai",
      -- colorscheme = "nightfox",
      -- colorscheme = "kanagawa",
    },
  },
}
