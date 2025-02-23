require("config.lazy")
require("config.options")
require("config.keymaps")

vim.o.showtabline = 2  -- 始终显示 tabline

vim.g.neovide_use_gpu = true  -- 启用 GPU 渲染
vim.o.guifont = "0xProto Nerd Font:h14"  -- 设置字体为 Nerd Font

vim.cmd [[
  highlight NormalFloat guibg=#282828
  highlight FloatBorder guibg=#282828 guifg=#a89984]]
