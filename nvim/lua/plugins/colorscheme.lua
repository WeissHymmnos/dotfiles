return {
  {
    "morhetz/gruvbox",  -- 或者使用其他 Gruvbox 版本，例如 "ellisonleao/gruvbox.nvim"
    name = "gruvbox",
    priority = 1000,
    config = function()
      -- 设置背景透明
      vim.cmd("colorscheme gruvbox")
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })  -- 设置 Normal 背景为透明
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })  -- 设置 SignColumn 背景为透明
      vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })  -- 设置 VertSplit 背景为透明
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })  -- 设置状态栏背景为透明（如果需要）
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })  -- 设置非活动状态栏背景为透明（如果需要）
      vim.api.nvim_set_hl(0, "Terminal", { bg = "NONE" })  -- 设置非活动状态栏背景为透明（如果需要）
    end,
  },
}
