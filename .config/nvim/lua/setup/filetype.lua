require("filetype").setup({
    overrides = {
        -- extensions = {
        --     -- Set the filetype of *.pn files to potion
        --     yaml = "cfn",
        -- },
        -- literal = {
        --     -- Set the filetype of files named "MyBackupFile" to lua
        --     MyBackupFile = "lua",
        -- },
        complex = {
            -- Set the filetype of any full filename matching the regex to gitconfig
            -- [".*git/config"] = "gitconfig", -- Included in the plugin
            -- ["cfn-.*%.ya?ml"] = "cloudformation",
        },

  --" autocmd BufRead,BufNewFile cfn-*.yaml,cfn-*.yml call SetCloudFormationOptions()
        -- The same as the ones above except the keys map to functions
        -- function_extensions = {
        --     ["cpp"] = function()
        --         vim.bo.filetype = "cpp"
        --         -- Remove annoying indent jumping
        --         vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
        --     end,
        --     ["pdf"] = function()
        --         vim.bo.filetype = "pdf"
        --         -- Open in PDF viewer (Skim.app) automatically
        --         vim.fn.jobstart(
        --             "open -a skim " .. '"' .. vim.fn.expand("%") .. '"'
        --         )
        --     end,
        -- },
        -- function_literal = {
        --     Brewfile = function()
        --         vim.cmd("syntax off")
        --     end,
        -- },

        -- function_complex = {
        --     ["cfn-.*%.ya?ml"] = function()
        --         vim.cmd([[
        --             set filetype=cloudformation
        --             set syntax=yaml
        --         ]])
        --     end,
        -- },

        shebang = {
            -- Set the filetype of files with a dash shebang to sh
            dash = "sh",
        },
    },
})
