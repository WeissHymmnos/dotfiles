
return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")

    -- 启用 Snippet 的历史记录，允许重复展开
    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,  -- 允许自动触发 snippets
    })

    -- 绑定 Tab 键来展开 snippet
    vim.api.nvim_set_keymap("i", "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>", {silent = true})
    vim.api.nvim_set_keymap("s", "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>", {silent = true})
    vim.api.nvim_set_keymap("i", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {silent = true})
    vim.api.nvim_set_keymap("s", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {silent = true})
  end
}
