return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- C++
                null_ls.builtins.formatting.clang_format,  -- 格式化
                null_ls.builtins.diagnostics.cppcheck,  -- 语法检查
                
                -- LaTeX
                null_ls.builtins.formatting.latexindent,
                null_ls.builtins.diagnostics.chktex,

                -- Python
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.flake8,

                -- Lua
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.luacheck,

                -- Shell
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.diagnostics.shellcheck,

                -- JSON
                null_ls.builtins.formatting.json_tool,
                null_ls.builtins.diagnostics.jsonlint,

                -- Markdown
                null_ls.builtins.formatting.markdownlint,
                null_ls.builtins.diagnostics.markdownlint,
            },
            -- 使用
            on_attach = function(client)
                if client.server_capabilities.document_formatting then
                    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
                end
            end,
        })

    end,
}
