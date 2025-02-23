return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
	dashboard.section.header.val = {
	    "⠀⠀⠀⠀⢀⠠⠤⠀⢀⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	    "⠀⠀⠐⠀⠐⠀⠀⢀⣾⣿⡇⠀⠀⠀⠀⠀⢀⣼⡇⠀⠀⠀⠀",
	    "⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⠀⠀⠀⠀⣴⣿⣿⠇⠀⠀⠀⠀",
	    "⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣇⠀⠀⢀⣾⣿⣿⣿⠀⠀⠀⠀⠀",
	    "⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠐⠀⡀",
	    "⠀⠀⠀⠀⢰⡿⠉⠀⡜⣿⣿⣿⡿⠿⢿⣿⣿⡃⠀⠀⠂⠄⠀",
	    "⠀⠀⠒⠒⠸⣿⣄⡘⣃⣿⣿⡟⢰⠃⠀⢹⣿⡇⠀⠀⠀⠀⠀",
	    "⠀⠀⠚⠉⠀⠊⠻⣿⣿⣿⣿⣿⣮⣤⣤⣿⡟⠁⠘⠠⠁⠀⠀",
	    "⠀⠀⠀⠀⠀⠠⠀⠀⠈⠙⠛⠛⠛⠛⠛⠁⠀⠒⠤⠀⠀⠀⠀",
	    "⠨⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠀⠀⠀⠀⠀⠀",
	    "⠁⠃⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
}      -- 猫猫
	dashboard.section.header.opts.hl = "Error"
--	"	    /|､		  ",
--	"	   (˚ˎ｡7	  ",
--	"	   |､˜〵          ",
--	"	   じしˍ,)ノ	  ",
	
        -- 快捷按钮（增加 Lazy 和 Mason）
        dashboard.section.buttons.val = {
            dashboard.button("f", "󰈞  Find Files", ":Telescope find_files<CR>"),
            dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
            dashboard.button("l", "  Lazy", ":Lazy<CR>"),
            dashboard.button("m", "󰭴  Mason", ":Mason<CR>"),
            dashboard.button("q", "󰿅  Quit", ":qa<CR>"),
        }

        
        -- 配色适配
        dashboard.section.header.opts.hl = "Type"
        dashboard.section.buttons.opts.hl = "Keyword"
        dashboard.section.footer.opts.hl = "Comment"
        dashboard.section.footer.val = "🐾 Welcome to Happy Hacking CatVim  !"

        -- 🚀 组合所有部分（已移除项目文件夹）
        dashboard.config.layout = {
            { type = "padding", val = 3 },
            dashboard.section.header,
            { type = "padding", val = 3 },
            dashboard.section.buttons,
            { type = "padding", val = 1 },
            dashboard.section.footer,
        }
        -- 启动
        alpha.setup(dashboard.opts)
    end,
}
