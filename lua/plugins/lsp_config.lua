return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 配置全局默认 capabilities
      vim.lsp.config("*", { capabilities = capabilities })

      local servers = {
        "clangd",
        "jsonls",
        "lua_ls",
        "pyright",
        "texlab",
        "vtsls",
      }

      -- 特殊配置 lua_ls 以支持 Neovim API
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
          },
        },
      })

      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end,
  },
}
