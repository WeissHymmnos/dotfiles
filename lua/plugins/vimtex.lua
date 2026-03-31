return {
  "lervag/vimtex",
  ft = "tex",
  config = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk = {
      build_dir = './build',
      options = {
        '-xelatex',
        '-interaction=nonstopmode',
        '-synctex=1','-file-line-error',},
    }
    vim.g.vimtex_fold_enabled = 1
    vim.g.vimtex_quickfix_mode = 0
  end,
}
