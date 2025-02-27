return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    notifier = {
      timeout = 3000, -- 通知默认超时时间，单位是毫秒
      width = { min = 40, max = 0.4 }, -- 通知宽度设置
      height = { min = 1, max = 0.6 }, -- 通知高度设置
      margin = { top = 0, right = 1, bottom = 0 }, -- 边距设置
      padding = true, -- 在通知窗口两侧添加内边距
      sort = { "level", "added" }, -- 按照等级和添加时间排序
      level = vim.log.levels.TRACE, -- 默认显示日志等级（TRACE 为最低）
      icons = {
        error = " ",  -- 错误图标
        warn = " ",   -- 警告图标
        info = " ",   -- 信息图标
        debug = " ",  -- 调试图标
        trace = " ",  -- 跟踪图标
      },
      keep = function(notif)
        return vim.fn.getcmdpos() > 0 -- 如果当前在命令模式下，则保持通知
      end,
      style = "compact",  -- 通知样式（compact、fancy、minimal）
      top_down = true,    -- 通知从上到下显示
      date_format = "%R", -- 时间格式
      more_format = " ↓ %d lines ", -- 如果有更多内容，显示格式
      refresh = 50,       -- 刷新频率
    },

    -- 终端相关配置
    terminal = {},

  },
}
