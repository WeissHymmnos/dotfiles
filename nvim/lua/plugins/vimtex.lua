return {
  "lervag/vimtex",
  config = function()
    -- 配置 VimTeX
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'xelatex'
    vim.g.vimtex_fold_enabled = 1
  end,
}
