local opt = vim.opt        -- to set options
opt.completeopt = "menu,menuone,noselect"
opt.inccommand = "split"   -- Get a preview of replacements
opt.backspace = { "indent", "eol", "start" }
opt.encoding = "utf-8"     -- Set default encoding to UTF-8
opt.tabstop = 4            -- Number of spaces tabs count for
opt.shiftround = true      -- Round the shift indent
opt.shiftwidth = 4         -- Size of an indent
opt.expandtab = true       -- Use spaces instead of tabs
opt.smartindent = true     -- Insert indents automatically
opt.relativenumber = true
opt.showmatch = true       -- Show matching brackets (Damn this is so cool!)
opt.ignorecase = true      -- Case insensitive search
opt.smartcase = true       -- Do not ignore case with capitals
opt.cursorline = true
opt.linebreak = true       -- Stop words being broken on wrap
opt.list = true            -- Show some invisible characters
opt.splitbelow = true      -- Put new windows below current
opt.splitright = true      -- Put new windows right of current
opt.number = true          -- Show line numbers
opt.numberwidth = 5        -- Line number reserved space
opt.hlsearch = true        -- Highlight found searches
opt.incsearch = true       -- Shows the match while typing
opt.joinspaces = false     -- No double spaces with join
opt.cursorcolumn = true
opt.termguicolors = true   -- You will have bad experience for diagnostic messages when it's default 4000.
opt.signcolumn = "yes:1"   -- always show signcolumns
opt.colorcolumn= "100"     -- Make it obvious where 100 characters is
opt.foldmethod = "indent"
opt.cpoptions = opt.cpoptions + "$"          -- Show a $ sign in the change buffer
opt.wildignore = {"*/.git/*", "*/tmp/*", "*.swp"}
opt.listchars = { tab = " ", trail = "-", extends = ">", precedes = "<", nbsp = "+" }
-- opt.virtualedit=onemore -- Allow for cursor beyond last character
-- opt.softtabstop=4       -- Number of spaces for a tab while editing
-- opt.modelines=1         -- Disable modeline support
-- opt.wrap = true


opt.clipboard = "unnamedplus"
-- opt.spelllang = { "en_gb" }
vim.o.whichwrap = vim.o.whichwrap .. "<,>" -- Wrap movement between lines in edit mode with arrows
opt.undodir = vim.fn.stdpath("config") .. "/undo"
opt.undofile = true
-- Give me some fenced codeblock goodness
vim.g.markdown_fenced_languages = { "html", "javascript", "typescript", "css", "scss", "lua", "vim" }
