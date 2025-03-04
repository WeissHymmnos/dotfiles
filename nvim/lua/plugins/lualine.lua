local function usage_bar(percentage)
  local chars = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
  local index = math.ceil((percentage / 100) * #chars)
  index = math.max(1, math.min(index, #chars))
  return chars[index]
end

local function cpu_bar()
  local handle = io.popen("ps -A -o %cpu | awk '{s+=$1} END {print s}'")
  local result = handle:read("*a")
  handle:close()
  local cpu = tonumber(result) or 0
  return usage_bar(cpu/8) .. "CPU"
end

local function memory_bar()
local handle = io.popen("free | awk '/Mem:/ {print 100 - ($7/$2 * 100)}'")
  local result = handle:read("*a")
  handle:close()
  local ram = tonumber(result) or 100
  return usage_bar( ram) .. "RAM"
end


return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
	    theme = {
	      normal = { c = { fg = '#ebdbb2', bg = '#3c3836' } },
	      insert = { c = { fg = '#ebdbb2', bg = '#3c3836' } },
	      visual = { c = { fg = '#ebdbb2', bg = '#3c3836' } },
	      replace = { c = { fg = '#ebdbb2', bg = '#3c3836' } },
	      command = { c = { fg = '#ebdbb2', bg = '#3c3836' } },
	    },
            options = {
                theme = "gruvbox",
                icons_enabled = true,
                section_separators = { left = '', right = "" },
                component_separators = { '|', '|' },
                disabled_filetypes = { "NvimTree" },
            },
            sections = {
                lualine_a = { {'mode' , icon = ' '}} ,
        	lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = { {'filename', path = 4} },
                lualine_x = {
	      { cpu_bar, color = { fg = "#fabd2f", gui = "bold" } },
	      { memory_bar, color = { fg = "#83a598", gui = "bold" } },
	    },
                lualine_y = { 'progress' },
                lualine_z = {  
			{
                        function()
                            return os.date(" %H:%M:%S")
                        end,
                        padding = { left = 1, right = 1 },
                    } }            
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {}, 
            extensions = { 'nvim-tree', 'quickfix' }
        })
    end,
}
