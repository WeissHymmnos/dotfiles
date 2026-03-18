-- Ensure LSP tools can be found in the PATH, especially when started from external scripts
local extra_paths = {
    "/opt/homebrew/bin",
    "/usr/local/bin",
    "/usr/bin",
    "/bin",
    "/usr/sbin",
    "/sbin",
    vim.fn.expand("$HOME") .. "/.local/share/nvim/mason/bin", -- Mason tools path
}

for _, path in ipairs(extra_paths) do
    if vim.fn.isdirectory(path) == 1 then
        vim.env.PATH = path .. ":" .. vim.env.PATH
    end
end

require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.snippets")

vim.o.showtabline = 2  -- 始终显示 tabline

vim.g.neovide_use_gpu = true  -- 启用 GPU 渲染
vim.o.guifont = "0xProto Nerd Font:h14"  -- 设置字体为 Nerd Font

vim.cmd [[
  highlight NormalFloat guibg=#282828
  highlight FloatBorder guibg=#282828 guifg=#a89984]]

vim.env.LLM_KEY = os.getenv("LLM_KEY")
