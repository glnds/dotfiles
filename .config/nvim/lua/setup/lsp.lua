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
