return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✔",
                    package_pending = "➜",
                    package_uninstalled = "✘"
                }
            }
        })

        -- 自动安装 LSP 服务器
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "jsonls",
                "lua_ls",
                "pyright",
                "texlab",
                "vtsls",
            },
            automatic_installation = true,
        })
	end,
}
