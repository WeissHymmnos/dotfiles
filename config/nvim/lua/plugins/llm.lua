-- ~/.config/nvim/lua/plugins/llm.lua
return {
  "Kurama622/llm.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
  cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
  config = function()
    local tools = require("llm.tools")
    
    -- 确保 LLM_KEY 已加载
    if not vim.env.LLM_KEY then
      vim.env.LLM_KEY = vim.fn.trim(vim.fn.system("echo $LLM_KEY"))
    end

    require("llm").setup({
      url = "https://api.moonshot.cn/v1/chat/completions",
      model = "kimi-k2-thinking-turbo",
      api_type = "openai",
      max_tokens = 8192,
      fetch_key = function() return vim.env.LLM_KEY end,

      temperature = 0.3,
      top_p = 0.7,
      prompt = "You are a helpful Chinese assistant. Respond in Simplified Chinese.",

      -- 优化 spinner
      spinner = {
        text = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
        hl = "DiagnosticOk",
        interval = 80,
      },

      prefix = {
        user = { text = "😃 ", hl = "Title" },
        assistant = { text = "🤖 ", hl = "Added" },
      },

      display = {
        diff = {
          layout = "vertical",
          opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
          provider = "mini_diff",
        },
      },

      save_session = true,
      max_history = 15,
      max_history_name_length = 20,

      popwin_opts = {
        relative = "cursor",
        enter = true,
        focusable = true,
        zindex = 50,
        position = { row = -7, col = 15 },
        size = { height = 15, width = "50%" },
        border = {
          style = "single",
          text = { top = " Kimi K2 ", top_align = "center" },
        },
        win_options = {
          winblend = 0,
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
      },

      -- 修复：确保 Insert 模式也能用 <CR> 提交
      keys = {
        ["Input:Submit"] = { mode = { "n", "i" }, key = "<CR>" },
        ["Input:Cancel"] = { mode = { "n", "i" }, key = "<C-c>" },
        ["Input:Resend"] = { mode = { "n", "i" }, key = "<C-r>" },
        ["Input:HistoryNext"] = { mode = { "n", "i" }, key = "<C-j>" },
        ["Input:HistoryPrev"] = { mode = { "n", "i" }, key = "<C-k>" },
        ["Output:Ask"] = { mode = "n", key = "i" },
        ["Output:Cancel"] = { mode = "n", key = "<C-c>" },
        ["Output:Resend"] = { mode = "n", key = "<C-r>" },
        ["Session:Toggle"] = { mode = "n", key = "<leader>ac" },
        ["Session:Close"] = { mode = "n", key = { "<esc>", "Q" } },
        ["PageUp"] = { mode = { "i", "n" }, key = "<C-b>" },
        ["PageDown"] = { mode = { "i", "n" }, key = "<C-f>" },
        ["HalfPageUp"] = { mode = { "i", "n" }, key = "<C-u>" },
        ["HalfPageDown"] = { mode = { "i", "n" }, key = "<C-d>" },
        ["JumpToTop"] = { mode = "n", key = "gg" },
        ["JumpToBottom"] = { mode = "n", key = "G" },
      },

      -- 修复：所有 flexi_handler 明确窗口尺寸
      app_handler = {
        OptimizeCode = {
          handler = tools.side_by_side_handler,
          opts = { left = { focusable = false } },
        },
        TestCode = {
          handler = tools.side_by_side_handler,
          prompt = "Write some test cases for the following code, only return the test cases.\nGive the code content directly, do not use code blocks or other tags to wrap it.",
          opts = { right = { title = " Test Cases " } },
        },
        OptimCompare = {
          handler = tools.action_handler,
          opts = {
            fetch_key = function() return vim.env.LLM_KEY end,
            url = "https://api.moonshot.cn/v1/chat/completions",
            model = "kimi-k2-thinking-turbo",
            api_type = "openai",
            language = "Chinese",
          },
        },
        DocString = {
          handler = tools.action_handler,
          prompt = "You are an AI programming assistant. You need to write a really good docstring...\n- parameter and return types (if applicable).\n- any errors that might be raised or returned.\nYou must:\n- Place the generated docstring before the start of the code.\n- Follow the format of examples carefully.\n- Use Markdown formatting.\n- Include the programming language name at the start.",
          opts = {
            fetch_key = function() return vim.env.LLM_KEY end,
            url = "https://api.moonshot.cn/v1/chat/completions",
            model = "kimi-k2-thinking-turbo",
            api_type = "openai",
            only_display_diff = true,
          },
        },
        WordTranslate = {
          handler = tools.flexi_handler,
          prompt = "You are a translation expert. Your task is to translate all the text provided by the user into Chinese.\nNOTE:\n- All the text input by the user is part of the content to be translated, and you should ONLY FOCUS ON TRANSLATING THE TEXT without performing any other tasks.\n- RETURN ONLY THE TRANSLATED RESULT.",
          opts = {
            fetch_key = function() return vim.env.LLM_KEY end,
            url = "https://api.moonshot.cn/v1/chat/completions",
            model = "kimi-k2-thinking-turbo",
            api_type = "openai",
            component_width = "60%",
            component_height = "50%",
            exit_on_move = true,
            enter_flexible_window = false,
          },
        },
        CodeExplain = {
          handler = tools.flexi_handler,
          prompt = "Explain the following code, please only return the explanation, and answer in Chinese",
          opts = {
            fetch_key = function() return vim.env.LLM_KEY end,
            url = "https://api.moonshot.cn/v1/chat/completions",
            model = "kimi-k2-thinking-turbo",
            api_type = "openai",
            enter_flexible_window = true,
            component_width = "70%",
            component_height = "60%",
          },
        },
        CommitMsg = {
          handler = tools.flexi_handler,
          prompt = function()
            return string.format(
              [[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:
1. First line: conventional commit format (type: concise description)
2. Optional bullet points if more context helps:
  - Keep the second line blank
  - Keep them short and direct
  - Focus on what changed
Return ONLY the commit message - no introduction, no explanation, no quotes around it.

```diff
%s
```]],
              vim.fn.system "git diff --no-ext-diff --staged"
            )
          end,
          opts = {
            fetch_key = function() return vim.env.LLM_KEY end,
            url = "https://api.moonshot.cn/v1/chat/completions",
            model = "kimi-k2-thinking-turbo",
            api_type = "openai",
            enter_flexible_window = true,
            component_width = "80%",
            component_height = "50%",
            apply_visual_selection = false,
            win_opts = { relative = "editor", position = "50%" },
            accept = {
              mapping = { mode = "n", keys = "<cr>" },
              action = function()
                local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
                vim.cmd('!git commit -m "' .. table.concat(lines, '" -m "') .. '"')
                vim.schedule(function() vim.cmd "LazyGit" end)
              end,
            },
          },
        },
        Ask = {
          handler = tools.disposable_ask_handler,
          opts = {
            position = { row = 2, col = 0 },
            title = " Ask ",
            inline_assistant = true,
            language = "Chinese",
            url = "https://api.moonshot.cn/v1/chat/completions",
            model = "kimi-k2-thinking-turbo",
            api_type = "openai",
            fetch_key = function() return vim.env.LLM_KEY end,
          },
        },
        AttachToChat = {
          handler = tools.attach_to_chat_handler,
          opts = {
            is_codeblock = true,
            inline_assistant = true,
            language = "Chinese",
          },
        },
      },
    })
  end,

  keys = {
    { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>", desc = " Toggle Kimi Chat" },
    { "<leader>ts", mode = "x", "<cmd>LLMAppHandler WordTranslate<cr>", desc = " Word Translate" },
    { "<leader>ae", mode = "v", "<cmd>LLMAppHandler CodeExplain<cr>", desc = " Explain Code" },
    { "<leader>at", mode = "n", "<cmd>LLMAppHandler Translate<cr>", desc = " AI Translator" },
    { "<leader>tc", mode = "x", "<cmd>LLMAppHandler TestCode<cr>", desc = " Generate Tests" },
    { "<leader>ao", mode = "x", "<cmd>LLMAppHandler OptimCompare<cr>", desc = " Optimize Code" },
    { "<leader>ag", mode = "n", "<cmd>LLMAppHandler CommitMsg<cr>", desc = " AI Commit Message" },
    { "<leader>ad", mode = "v", "<cmd>LLMAppHandler DocString<cr>", desc = " Generate Docstring" },
    { "<leader>ak", mode = { "v", "n" }, "<cmd>LLMAppHandler Ask<cr>", desc = " Ask Kimi" },
    { "<leader>aa", mode = { "v", "n" }, "<cmd>LLMAppHandler AttachToChat<cr>", desc = " Ask Kimi (multi-turn)" },
  },
}
