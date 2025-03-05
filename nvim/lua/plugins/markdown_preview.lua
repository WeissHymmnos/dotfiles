return{
	"iamcco/markdown-preview.nvim",
	build = function ()
		vim.fn.system("cd app && yarn install")
	end,
	ft = {"markdown"},
	keys = {
		{"<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown Preview" }
	},
	config = function ()
		vim.g.mkdp_auto_start = 0
		vim.g.mkdp_auto_close = 1
		vim.g.mkdp_refresh_slow = 0
		vim.g.mkdp_browser = "firefox"
	end,
}
