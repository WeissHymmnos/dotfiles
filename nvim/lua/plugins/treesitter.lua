return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "query", "c", "cpp", "python", "latex", "bibtex", "markdown", "markdown_inline" },
        auto_install = true,
        highlight = {
          enable = true,
          -- VimTeX 建议在 TeX 文件中禁用 Treesitter 高亮以使用其自带的更强大的功能
          -- 如果你希望使用 Treesitter 高亮，可以移除 "latex"
          disable = { "latex" }, 
          additional_vim_regex_highlighting = { "latex" },
        },
        indent = { enable = true },
      })
    end,
  },
}
