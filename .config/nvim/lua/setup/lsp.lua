-- LSP setup

require("lspconfig").pyright.setup({})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})

require("mason-lspconfig").setup({
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

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
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
	},
})
