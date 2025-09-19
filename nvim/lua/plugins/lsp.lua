return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "mfussenegger/nvim-lint",     -- 语法检查
    },
    config = function()
        -- Mason
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "pyright", "jsonls", "bashls", "clangd", "vtsls" },
            automatic_installation = true,
        })

        -- LSP
        local lspconfig = require("lspconfig")
        local servers = { "lua_ls", "pyright", "jsonls", "bashls", "clangd", "vtsls" }
        for _, server in ipairs(servers) do
            lspconfig[server].setup({})
        end

        -- nvim-lint 
        local lint = require("lint")
        lint.linters_by_ft = {
            python = { "flake8" },
            lua = { "luacheck" },
            json = { "jsonlint" },
            sh = { "shellcheck" },
            markdown = { "markdownlint" },
        }

        -- 自动触发语法检查
        vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged" }, {
            callback = function()
                lint.try_lint()
            end,
        })

    end,
}
