local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader to space
vim.g.mapleader = ","

-- Nvim Tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<leader>u", ":NvimTreeFindFile<CR>", { silent = true })

-- Update Plugins
-- map("n", "<Leader>u", ":PackerSync<CR>")

-- Telescope
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<cr>
map("n", "<leader>f", '<cmd>lua require("telescope.builtin").find_files()<cr>')
map("n", "<leader>g", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
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



-- Trouble keymaps
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)


vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>",
  {silent = true, noremap = true}
)
