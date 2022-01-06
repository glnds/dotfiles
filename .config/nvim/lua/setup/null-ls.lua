-- Here is the formatting config
--
-- local null_ls = require("null-ls")
-- local lSsources = {
--   null_ls.builtins.formatting.prettier.with({
--     filetypes = {
--       "javascript",
--       "typescript",
--       "css",
--       "scss",
--       "html",
--       "json",
--       "yaml",
--       "markdown",
--       "graphql",
--       "md",
--       "txt",
--     },
--   }),
--   null_ls.builtins.formatting.stylua.with({
--     args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
--   }),
-- }
-- require("null-ls").setup({
--   sources = lSsources,
--   on_attach = function(client)
--     if client.resolved_capabilities.document_formatting then
--       vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
--     end
--   end,
-- })





local null_ls = require('null-ls')
local null_helpers = require('null-ls.helpers')

local cfn_lint = {
  name = "cfn_lint",
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "cloudformation"},
  generator = null_helpers.generator_factory({
    command = 'cfn-lint',
    to_stdin = true,
    from_stderr = true,
    args = { "--format", "parseable", "-" },
    format = "line",
    check_exit_code = function(code)
      return code == 0 or code == 255
    end,
    on_output = function(line, params)
      local row, col, end_row, end_col, code, message = line:match(":(%d+):(%d+):(%d+):(%d+):(.*):(.*)")
      local severity = null_helpers.diagnostics.severities["error"]

      if message == nil then
        return nil
      end

      if vim.startswith(code, "E") then
        severity = null_helpers.diagnostics.severities["error"]
      elseif vim.startswith(code, "W") then
        severity = null_helpers.diagnostics.severities["warning"]
      else
        severity = null_helpers.diagnostics.severities["information"]
      end

      return {
        message = message,
        code = code,
        row = row,
        col = col,
        end_col = end_col,
        end_row = end_row,
        severity = severity,
        source = "cfn-lint",
      }
    end,
  }),
}

--Built in formatters
local sources = {
  null_ls.builtins.diagnostics.hadolint,
  null_ls.builtins.formatting.terraform_fmt,
  null_ls.builtins.formatting.shfmt,
  null_ls.builtins.formatting.gofmt,
  null_ls.builtins.formatting.black.with({
      extra_args = { "--experimental-string-processing" }
  }),
  null_ls.builtins.formatting.isort.with({
      extra_args = { "--profile", "black" }
  }),
  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.diagnostics.write_good,
  null_ls.builtins.diagnostics.markdownlint,
  cfn_lint,
}

null_ls.config({
  debug=false,
  sources=sources,
  diagnostics_format = '[#{c}] #{m}',
})

require("lspconfig")["null-ls"].setup({
    -- on_attach = attach
    on_attach = function(client)
     if client.resolved_capabilities.document_formatting then
             vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
     end
  end
})

