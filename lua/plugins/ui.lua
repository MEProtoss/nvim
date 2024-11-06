vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#FF0000", bg = "#FF0000" })
vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#FBF3CB", bg = "#FF007C" })
vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#000000", bg = "#000000" })

return {
	{
		-- 戴上墨镜，这样您就只能看到自己关心的内容
		"miversen33/sunglasses.nvim",
		event = "VeryLazy",
		config = function()
			local sunglasses_options = {
				filter_percent = 0.65,
				filter_type = "NOSYNTAX",
			}
			require("sunglasses").setup(sunglasses_options)
			vim.cmd("SunglassesDisable")
		end,
	},
	-- a theme
	{ "ellisonleao/gruvbox.nvim" },

	-- a theme
	{ "savq/melange-nvim" },
	-- a theme
	{
		"sainnhe/vim-color-forest-night",
	},
	-- a theme
	{
		"malbernaz/monokai.nvim",
		config = function()
			require("monokai").setup({
				custom_hlgroups = {
					FlashCurrent = { fg = "#FF0000", bg = "#FF0000" },
					FlashLabel = { fg = "#FBF3CB", bg = "#FF007C" },
					FlashMatch = { fg = "#000000", bg = "#000000" },
				},
			})
		end,
	},
	-- 设置nvim默认主题
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "monokai", -- catppucin gruvbox monokai
		},
	},

	-- nightfoxtheme
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = {
					styles = {
						comments = "italic",
						keywords = "bold",
						types = "italic,bold",
					},
				},
			})
		end,
	},
	-- a theme
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			style = "night",
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}
