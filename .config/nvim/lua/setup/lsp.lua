-- LSP setup

local lspconfig = require("lspconfig")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
local null_helpers = require("null-ls.helpers")

--Built in formatters
local sources = {
	--Formatting
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.yamlfmt,
	null_ls.builtins.formatting.shfmt.with({ filetypes = { "sh" } }),
	null_ls.builtins.formatting.terraform_fmt,
	null_ls.builtins.formatting.gofumpt,
	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.formatting.black.with({
		extra_args = { "--experimental-string-processing" },
	}),
	null_ls.builtins.formatting.isort.with({
		extra_args = { "--profile", "black" },
	}),
	--Diagnostics
	null_ls.builtins.diagnostics.flake8,
	null_ls.builtins.diagnostics.hadolint,
	null_ls.builtins.diagnostics.write_good,
	null_ls.builtins.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
	null_ls.builtins.diagnostics.markdownlint,
	--Code Actions
	null_ls.builtins.code_actions.gitsigns,
	null_ls.builtins.diagnostics.cfn_lint,
}

null_ls.setup({
	debug = false,
	sources = sources,
	diagnostics_format = "[#{c}] #{m}",
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		-- lsp
		"lua-language-server",
		"vim-language-server",
		"yaml-language-server",
		"json-lsp",
		"bash-language-server",
		"typescript-language-server",

		-- formatting
		"prettierd",
		"shfmt",
		"stylua",
		"black",
		"gofumpt",
		"isort",
		"flake8",
		"yamlfmt",

		-- diagnostics
		"markdownlint",
		"shellcheck",
		"write-good",
		"yamllint",
		"hadolint",
		"cfn-lint",
	},
	auto_update = true,
	run_on_start = false,
})

-- require("mason-lspconfig").setup_handlers({
-- 	function(server)
-- 		local opts = {
-- 			on_attach = require("plugins.lsp.handlers").on_attach,
-- 			capabilities = require("plugins.lsp.handlers").capabilities,
-- 		}
-- 		require("lspconfig")[server].setup(opts)

-- 		require("typescript").setup({
-- 			server = {
-- 				on_attach = opts.on_attach,
-- 				capabilities = opts.capabilities,
-- 			},
-- 		})

-- 		if server == "sumneko_lua" then
-- 			local sumneko_opts = require("plugins.lsp.settings.sumneko")
-- 			sumneko_opts["on_attach"] = opts.on_attach
-- 			sumneko_opts["capabilities"] = opts.capabilities
-- 			require("lspconfig")[server].setup(sumneko_opts)
-- 		end

-- 		if server == "yamlls" then
-- 			local yamlls_opts = require("plugins.lsp.settings.yamlls")
-- 			yamlls_opts["on_attach"] = opts.on_attach
-- 			yamlls_opts["capabilities"] = opts.capabilities
-- 			require("lspconfig")[server].setup(yamlls_opts)
-- 		end

-- 		if server == "jsonls" then
-- 			local jsonls_opts = require("plugins.lsp.settings.jsonls")
-- 			jsonls_opts["on_attach"] = opts.on_attach
-- 			jsonls_opts["capabilities"] = opts.capabilities
-- 			require("lspconfig")[server].setup(jsonls_opts)
-- 		end
-- 	end,
-- })

-- require("mason-lspconfig").setup({
-- 	automatic_installation = false,
-- })
