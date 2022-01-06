vim.g.mapleader = ','

require('plugins')


-- Autocompletion
--
-- local use = require('packer').use
-- require('packer').startup(function()
--   use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
--   use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
--   use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
--   use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
--   use 'L3MON4D3/LuaSnip' -- Snippets plugin
-- end)

-- -- Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- local lspconfig = require('lspconfig')

-- -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     -- on_attach = my_custom_on_attach,
--     capabilities = capabilities,
--   }
-- end

-- -- luasnip setup
-- local luasnip = require 'luasnip'

-- -- nvim-cmp setup
-- local cmp = require 'cmp'
-- cmp.setup {
--   snippet = {
--     expand = function(args)
--       require('luasnip').lsp_expand(args.body)
--     end,
--   },
--   mapping = {
--     ['<C-p>'] = cmp.mapping.select_prev_item(),
--     ['<C-n>'] = cmp.mapping.select_next_item(),
--     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-e>'] = cmp.mapping.close(),
--     ['<CR>'] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = true,
--     },
--     ['<Tab>'] = function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end,
--     ['<S-Tab>'] = function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end,
--   },
--   sources = {
--     { name = 'nvim_lsp' },
--     { name = 'luasnip' },
--   },
-- }






-- require("null-ls").setup({
--     sources = {
--         require("null-ls").builtins.formatting.stylua,
--         require("null-ls").builtins.diagnostics.eslint,
--         require("null-ls").builtins.completion.spell,
--     },
-- })


-- local null_ls = require('null-ls')
-- local null_helpers = require('null-ls.helpers')

-- local cfn_lint = {
-- method = null_ls.methods.DIAGNOSTICS,
-- filetypes = {'yaml'},
-- generator = null_helpers.generator_factory({
-- command = "cfn-lint",
-- to_stdin = true,
-- to_stderr = true,
-- args = { "--format", "parseable", "-" },
-- format = "line",
-- check_exit_code = function(code)
-- return code == 0 or code == 255
-- end,
-- on_output = function(line, params)
-- local row, col, end_row, end_col, code, message = line:match(":(%d+):(%d+):(%d+):(%d+):(.*):(.*)")
-- local severity = null_helpers.diagnostics.severities['error']

-- if message == nil then
-- return nil
-- end

-- if vim.startswith(code, "E") then
-- severity = null_helpers.diagnostics.severities['error']
-- elseif vim.startswith(code, "W") then
-- severity = null_helpers.diagnostics.severities['warning']
-- else
-- severity = null_helpers.diagnostics.severities['information']
-- end

-- return {
-- message = message,
-- code = code,
-- row = row,
-- col = col,
-- end_col = end_col,
-- end_row = end_row,
-- severity = severity,
-- source = "cfn-lint",
-- }
-- end,
-- })
-- }

-- null_ls.config({
-- sources = {
-- cfn_lint,
-- }
-- })


