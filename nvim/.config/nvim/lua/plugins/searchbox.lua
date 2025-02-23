return{
    "VonHeikemen/searchbox.nvim",
    dependencies = {
        { "MunifTanjim/nui.nvim" } -- 依赖
    },
    config = function()
        require("searchbox").setup({
	  popup = {
	    relative = "win", 
	    position = {
	      row = "8%",
	      col = "95%",
	    },
	    size = {
	      width = 30,
	      height = "auto",
	    },
	    border = {
	      style = "rounded",
	      text = {
		top = " Search ",
		top_align = "center",
	      },
	      highlight = "FloatBorder", 
	    },
	    win_options = {
	      winblend = 10, -- 透明度
	      winhighlight = "Normal:Normal,FloatBorder:FloatBorder", 
	    },
	  },
	})
end,
}
