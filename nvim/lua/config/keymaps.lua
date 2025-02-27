local keymap = vim.keymap


vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

----------INSERT----------

----------VISUAL----------

-- 不定行移动术
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- 两种粘贴模式
keymap.set('v', 'p', '"_dP', { noremap = true })
keymap.set('v', '<leader>p', 'p', { noremap = true })

----------NORMAL----------

-- 窗口分裂术
keymap.set('n', '\\', '<CMD>:sp<CR>', { desc = 'Split window horizontally' })
keymap.set('n', '|', '<CMD>:vsp<CR>', { desc = 'Split window vertically' })

-- 取消搜索高亮
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- 窗口离开
keymap.set('n', '<leader>q', '<cmd>:q<CR>', { desc = 'Quit current window' })
keymap.set('n', '<C-q>', '<cmd>:qall<CR>', { desc = 'Quit all window' })

-- 窗口移动
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- 窗口选择
keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = 'Move focus to the left window' })
keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = 'Move focus to the lower window' })
keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = 'Move focus to the upper window' })
keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = 'Move focus to the right window' })

-- 窗口大小调节
keymap.set('n', '+', '<C-w>|<C-w>_', { desc = 'maximize nvim pane' })
keymap.set('n', '=', '<C-w>=', { desc = 'Restore nvim panes' })

-- QuickFix
keymap.set('n', ']q', '<cmd>cnext<cr>', { desc = 'Go to next qf item' })
keymap.set('n', '[q', '<cmd>cprev<cr>', { desc = 'Go to prev qf item' })

-- 翻页调节
keymap.set('n', '<C-d>', '8j', { desc = 'Scroll down by 8 lines' })
keymap.set('n', '<C-u>', '8k', { desc = 'Scroll up by 8 lines' })

-- Buffer 左右翻页 H L
keymap.set('n', 'L', '<cmd>bnext<cr>', { desc = 'Go to next buffer' })
keymap.set('n', 'H', '<cmd>bprev<cr>', { desc = 'Go to prev buffer' })

-- telescope stuff
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- neotree
keymap.set('n', '<leader>e', ':Neotree toggle left filesystem<CR>', { noremap = true, silent = true })	-- 快捷键映射：<leader>e 打开左侧文件系统

-- 映射空格 + TH 启动第一个终端并进入终端模式
vim.api.nvim_set_keymap('n', '<Space>th', ':split | term<CR>:startinsert<CR>', { noremap = true, silent = true })

-- 映射空格 + TV 启动第二个终端并进入终端模式
vim.api.nvim_set_keymap('n', '<Space>tv', ':vsplit | term<CR>:startinsert<CR>', { noremap = true, silent = true })-- 关闭终端并退出终端模式

keymap.set('t', '<C-q>', function()
  local terminal, _ = Snacks.terminal.get()
  if terminal then
    vim.cmd("quit")
  else
    print("No terminal open")
  end
end, { noremap = true, silent = true })


-- searchbox stuff
vim.keymap.set("n", "<leader>sf", "<cmd>SearchBoxMatchAll<CR>", { desc = "Search in buffer" }) -- 全局搜索
vim.keymap.set("n", "<leader>sr", "<cmd>SearchBoxReplace<CR>", { desc = "Search and replace" }) -- 替换
vim.keymap.set("n", "<leader>sl", "<cmd>SearchBoxIncSearch<CR>", { desc = "Live search" }) -- 类似 / 搜索


