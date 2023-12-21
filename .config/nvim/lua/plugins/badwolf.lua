return {
  {
    "sjl/badwolf",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme badwolf]])
      vim.cmd("set background=dark")
      vim.cmd("highlight ColorColumn ctermbg=0 guibg=#303030")
      vim.cmd("highlight cursorline ctermbg=0 guibg=#303030")
    end,
  },
}
