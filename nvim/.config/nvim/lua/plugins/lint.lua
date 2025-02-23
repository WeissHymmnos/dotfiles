return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        
        -- 配置Linter
        lint.linters_by_ft = {
            python = { "flake8" },
            lua = { "luacheck" },
            json = { "jsonlint" },
            sh = { "shellcheck" },
            markdown = { "markdownlint" },
	    cpp = { "cppcheck" },
	    tex = { "chktex" },
        }

        -- 触发
        vim.api.nvim_create_autocmd( "BufWritePost", {
            callback = function()
                local ft = vim.bo.filetype
                if lint.linters_by_ft[ft] then
                    lint.try_lint()
		end
            end,
        })
    end,
}
