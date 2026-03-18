return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- 基础 LSP 快捷键
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      end,
    })

    -- 配置 Texlab
    vim.lsp.config('texlab', {
      capabilities = capabilities,
      settings = {
        texlab = {
          build = {
            onSave = false, -- 关闭 texlab 的自动构建，交给 VimTeX 处理
            args = { "-pdfxe", "-interaction=nonstopmode", "-synctex=1", "%f" },
            executable = "latexmk",
            forwardSearchAfter = true,
          },
          forwardSearch = {
            executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
            args = { "%l", "%p", "%f" },
          },
          chktex = {
            onOpenAndSave = true, -- 启动時檢查
          },
        },
      },
    })
    vim.lsp.enable('texlab')

    -- 其他已安装的 LSP (由 Mason 管理)
    local servers = { "clangd", "pyright", "lua_ls", "vtsls", "jsonls" }
    for _, lsp in ipairs(servers) do
      vim.lsp.config(lsp, {
        capabilities = capabilities,
      })
      vim.lsp.enable(lsp)
    end
  end,
}
