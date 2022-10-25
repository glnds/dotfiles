local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader to space
vim.g.mapleader = ","

-- Disabling escape key. It's too far away!
map("i", "<esc>", "<nop>")

-- `jj` is much better :)
map("i", "jj", "<esc>")

-- Visual mode
map("n", "<Leader><Leader>", "V|")

-- Copy/Paste
map("v", "<Leader>c", '"+y')
map("n", "<Leader>v", '"+p')

-- Nvim Tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- Update Plugins
map("n", "<Leader>u", ":PackerSync<CR>")

-- Quick new file
map("n", "<Leader>n", "<cmd>enew<CR>")

-- Easy select all of file
map("n", "<Leader>sa", "ggVG<c-$>")

-- Make visual yanks place the cursor back where started
map("v", "y", "ygv<Esc>")

-- Easier file save
map("n", "<Leader>w", "<cmd>:w<CR>")

-- Tab to switch buffers in Normal mode
map("n", "<Leader>s", ":bnext<CR>")
map("n", "<Leader>a", ":bprevious<CR>")

-- Keep search results centred
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Make Y yank to end of the line
map("n", "Y", "y$")

-- Line bubbling
map("n", "<c-j>", "<cmd>m .+1<CR>==", { silent = true })
map("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
map("v", "<c-j>", ":m '>+1<CR>==gv=gv", { silent = true })
map("v", "<c-k>", ":m '<-2<CR>==gv=gv", { silent = true })

-- Move single row on wrapped lines
map("n", "j", "gj")
map("n", "k", "gk")

-- Disable Ex mode
map("n", "Q", "<nop>")

-- Insert newline on Enter in normal mode
map("n", "<S-Enter", "O<esc>")
map("n", "<CR>", "o<esc>")

-- After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr><esc>", { silent = true })

-- Easy add date/time
map("n", "<Leader>t", "\"=strftime('%c')<CR>Pa", { silent = true })

-- Disabling arrowaddww keys in normal and insert mode
map("n", "<left>", "<nop>")
map("n", "<up>", "<nop>")
map("n", "<right>", "<nop>")
map("n", "<down>", "<nop>")
map("i", "<left>", "<nop>")
map("i", "<up>", "<nop>")
map("i", "<right>", "<nop>")
map("i", "<down>", "<nop>")

-- Quicker window movement
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

-- Telescope
map("n", "<leader>f", '<cmd>lua require("telescope.builtin").find_files()<cr>')
map("n", "<leader>g", '<cmd>lua require("telescope.builtin").git_files()<cr>')
map("n", "<leader>r", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>')
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>')
map("n", "<leader>j", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map("n", "<leader>h", '<cmd>lua require("telescope.builtin").git_bcommits()<cr>')
map("n", "<leader>p", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>')
map("n", "<leader>c", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')
map("n", "<leader>i", '<cmd>lua require("telescope.builtin").git_status()<cr>')
map("n", "<leader>ca", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>')
map("n", "<leader>cs", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>')
map("n", "<leader>cd", '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>')
map("n", "<leader>cr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>')

-- Hop
map("n", "m", "<cmd>lua require'hop'.hint_words()<cr>")
map("n", ";", "<cmd>lua require'hop'.hint_lines()<cr>")
map("v", "m", "<cmd>lua require'hop'.hint_words()<cr>")
map("v", ";", "<cmd>lua require'hop'.hint_lines()<cr>")

-- Symbols outline
map("n", "<leader>o", ":SymbolsOutline<cr>")

-- Trouble keymaps
map("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true })
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true })
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true })
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true })
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true })
map("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true })

-- Diagnostics
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { silent = true })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { silent = true })
