return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✔",  -- 已安装的包
                    package_pending = "➜",    -- 正在安装
                    package_uninstalled = "✘" -- 未安装
                }
            }
        })

        -- 自动安装 LSP 服务器
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",               -- C/C++ 语言服务器
                "jsonls",               -- JSON 语言服务器
                "lua_ls",               -- Lua 语言服务器
                "pyright",              -- Python 语言服务器
                "texlab",               -- LaTeX 语言服务器
                "vtsls",                -- TypeScript/JavaScript 语言服务器（Volar 替代方案）
            },
            automatic_installation = true,
        })
	end,
}
