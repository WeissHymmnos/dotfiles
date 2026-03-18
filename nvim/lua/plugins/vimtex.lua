return {
  "lervag/vimtex",
  lazy = false, -- VimTeX 建议不要延迟加载
  config = function()
    -- 配置 VimTeX
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_compiler_method = 'latexmk' -- 使用 latexmk 作为总调度
    vim.g.vimtex_compiler_latexmk = {
      build_dir = 'build', -- 设置构建目录 (建议不加 ./)
      callback = 1,
      continuous = 1,
      executable = 'latexmk', -- 这里必须是 latexmk
      options = {
        '-pdfxe', -- 关键：告诉 latexmk 使用 xelatex 引擎
        '-verbose',
        '-file-line-error',
        '-interaction=nonstopmode',
        '-synctex=1',
      },
    }
    vim.g.vimtex_fold_enabled = 1

    -- 自定义快捷键 (使用空格 + l 前缀)
    local keymap = vim.keymap
    keymap.set('n', '<leader>ll', '<cmd>VimtexCompile<cr>', { desc = 'Vimtex: 编译' })
    keymap.set('n', '<leader>lv', '<cmd>VimtexView<cr>', { desc = 'Vimtex: 查看PDF' })
    keymap.set('n', '<leader>lt', '<cmd>VimtexTocOpen<cr>', { desc = 'Vimtex: 目录' })
    keymap.set('n', '<leader>lc', '<cmd>VimtexClean<cr>', { desc = 'Vimtex: 清理中间文件' })
    keymap.set('n', '<leader>le', '<cmd>VimtexErrors<cr>', { desc = 'Vimtex: 查看错误' })
    keymap.set('n', '<leader>lk', '<cmd>VimtexStop<cr>', { desc = 'Vimtex: 停止编译' })
    keymap.set('n', '<leader>li', '<cmd>VimtexInfo<cr>', { desc = 'Vimtex: 信息' })
  end,
}
