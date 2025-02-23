return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                numbers = "none",
                separator_style = "thick",
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "📂 File Explorer",
                        text_align = "left",
                        separator = "thick",
                        highlight = "Directory",
                        padding = 0
                    },
                },
                show_buffer_close_icons = true,
		buffer_close_icon = '✗',
                show_close_icon = false,
                enforce_regular_tabs = true,
            },
        })
    end,
}

