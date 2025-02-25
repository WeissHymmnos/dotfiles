local ls = require("plugins.luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node

-- 定义通用的片段
ls.add_snippets("all", {
  s("date", {
    t("Today is: "), i(1, os.date("%Y-%m-%d"))
  }),

  s("sig", {
    t("Yours sincerely,\n"), i(1, "Your Name")
  }),

  -- 自动触发的 if 语句
  s("if", {
    t("if "), i(1, "condition"), t(" then\n  "), i(2, "body"), t("\nend")
  }),

  -- 反转文本的动态片段
  s("reverse", {
    t("Reversed text: "), f(function(_, snip)
      return snip.input[1]:reverse()  -- 反转输入文本
    end, {1})
  }),
})

-- 为 Lua 语言添加专用片段
ls.add_snippets("lua", {
  s("for", {
    t("for "), i(1, "i"), t(" = 1, "), i(2, "10"), t(", 1 do\n  "), i(3), t("\nend")
  })
})

-- 为 LaTeX 语言添加片段
ls.add_snippets("tex", {
  s("beg", {
    t("\\begin{"), i(1, "environment"), t("}\n  "), i(2, "content"), t("\n\\end{"), i(1), t("}")
  }),

  s("mk", {
    t("$"), i(1, "math"), t("$")
  }),

  s("dm", {
    t("\\[\n  "), i(1, "math"), t("\n\\]")
  }),
})
