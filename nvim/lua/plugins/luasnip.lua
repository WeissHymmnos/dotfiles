
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

    -- 移除冲突的全局 Tab 映射，逻辑将整合到 nvim-cmp 中
  end
}
