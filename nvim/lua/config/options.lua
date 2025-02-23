local opt = vim.opt


vim.loader.enable()
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.markdown_folding = 1

-- [[ Setting options ]]
-- See `:help opt`
--  For more options, you can see `:help option-list`
-- 终端真颜色
opt.termguicolors = true

-- 左侧多一列
opt.signcolumn = "yes"

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 行号
opt.relativenumber = true
opt.number = true

-- 防止包裹
opt.wrap = false

-- 只显示全局状态栏
opt.laststatus = 3

-- 启用鼠标
opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- 系统剪切板
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = 'auto'

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- 窗口位置
-- opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- 光标行
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 5
