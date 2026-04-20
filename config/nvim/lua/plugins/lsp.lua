return {
  "nvimtools/none-ls.nvim",  -- 核心插件，必须明确安装
  dependencies = {
    "nvimtools/none-ls-extras.nvim",     -- flake8 的新家
    "gbprod/none-ls-shellcheck.nvim",    -- shellcheck 的新家
    "jay-babu/mason-null-ls.nvim",       -- 只用于安装工具
  },
  config = function()
    local null = require("null-ls")

    -- 关键：用 extras 替换旧 builtins（2025 年标准写法）
    null.setup({
      debug = true,  -- 临时开启，调试后关掉
      sources = {
        -- 诊断（diagnostics）
        require("none-ls.diagnostics.flake8"),          -- flake8，从 extras 加载
        require("none-ls-shellcheck.diagnostics"),      -- shellcheck，从专用插件加载

        -- 格式化（formatting）
        null.builtins.formatting.black,
        null.builtins.formatting.stylua,
      },
    })

    -- mason-null-ls：只安装工具，不自动设置 sources（避免旧 builtins 错误）
    require("mason-null-ls").setup({
      ensure_installed = { "black", "flake8", "shellcheck", "stylua" },
      automatic_installation = true,  -- 安装工具：是
      automatic_setup = false,        -- 自动设置 sources：否（关键！）
    })
  end,
}       
