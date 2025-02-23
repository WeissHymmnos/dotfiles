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
    terminal = {
      "folke/edgy.nvim", 
      ---@module 'edgy'
      ---@param opts Edgy.Config
      opts = function(_, opts)
        for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
          opts[pos] = opts[pos] or {}
          table.insert(opts[pos], {
            ft = "snacks_terminal",
            size = { height = 0.3 },
            background = "NONE",
            title = "%{b:snacks_terminal.id}: %{b:term_title}",
            filter = function(_buf, win)
              return vim.w[win].snacks_win
                and vim.w[win].snacks_win.position == pos
                and vim.w[win].snacks_win.relative == "editor"
                and not vim.w[win].trouble_preview
            end,
          })
        end
      end,
    },

    -- snacks_terminal 特定的配置
    bo = {
      filetype = "terminal",  -- 设置终端文件类型为 snacks_terminal
    },
    wo = {
	    background = "none",
    },  -- 这里可以添加更多的窗口选项
    keys = {
      q = "hide",  -- 按键 'q' 隐藏终端窗口
      gf = function(self)
        local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
        if f == "" then
          Snacks.notify.warn("No file under cursor")  -- 如果光标下没有文件，则显示警告
        else
          self:hide()  -- 隐藏终端
          vim.schedule(function()
            vim.cmd("e " .. f)  -- 打开光标下的文件
          end)
        end
      end,
      term_normal = {
        "<esc>",  -- 双击 'esc' 键退出终端模式
        function(self)
          self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
          if self.esc_timer:is_active() then
            self.esc_timer:stop()
            vim.cmd("stopinsert")
          else
            self.esc_timer:start(200, 0, function() end)
            return "<esc>"
          end
        end,
        mode = "t",
        expr = true,
        desc = "Double escape to normal mode",  -- 双击 'esc' 退出终端模式
      },
    },
  },
}
