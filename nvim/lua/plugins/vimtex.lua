return {
  "lervag/vimtex",
  config = function()
    -- 配置 VimTeX
        vim.g.vimtex_view_method = 'zathura'
	vim.g.vimtex_compiler_method = 'latexmk'  -- 使用 latexmk 作为编译工具
	vim.g.vimtex_compiler_latexmk = {
	  build_dir = './build',  -- 设置构建目录
	  executable = 'xelatex',  -- 设置具体的编译器为 xelatex
	  options = {
	    '-interaction=nonstopmode',  -- 设置非交互模式
	    '-synctex=1',  -- 启用 Synctex
	  },
	}    vim.g.vimtex_fold_enabled = 1
  end,
}
