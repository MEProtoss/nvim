return {
	-- 一个用于ranger和nvim通讯的插件
	{
		"kevinhwang91/rnvimr",
	},

	-- 用于linux系统，fcitx输入法环境，在退出insert模式时，自动切换至英文
	{
		"yaocccc/vim-fcitx2en",
		setup = function()
			vim.g.fcitx_on_events = "InsertLeave,InsertEnter"
		end,
		event = { "InsertLeave", "InsertEnter" },
	},

	-- add symbols-outline 查看代码大纲
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		config = true,
	},

	-- 中文help doc
	{
		"yianwillis/vimcdoc",
		event = "CmdLineEnter",
	},

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		keys = {
			{
				"<leader>cp",
				ft = "markdown",
				"<cmd>MarkdownPreviewToggle<cr>",
				desc = "Markdown Preview",
			},
		},
		config = function()
			vim.cmd([[do FileType]])
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_browser = "wyeb"
			vim.g.mkdp_markdown_css = "~/.config/nvim/markdown/markdown.css"
			vim.g.mkdp_theme = "dark"
			vim.g.mkdp_combine_preview_auto_refresh = 1
			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_auto_close = 1
		end,
		ft = { "markdown" },
	},

	-- {
	-- 	-- 浮动终端
	-- 	"voldikss/vim-floaterm",
	-- 	setup = function()
	-- 		require("vim-floaterm").setup()
	-- 	end,
	-- },
	--
	-- leetcode.nvim
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- telescope 所需
			"MunifTanjim/nui.nvim",

			-- 可选
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			-- 配置放在这里
			---@type lc.lang
			lang = "python3",
			injector = { ---@type table<lc.lang, lc.inject>
				["cpp"] = {
					before = { "#include <bits/stdc++.h>", "using namespace std;" },
					after = "int main() {}",
				},
				["java"] = {
					before = "import java.util.*;",
				},
			},
			cn = { -- leetcode.cn
				enabled = true, ---@type boolean
				translator = true, ---@type boolean
				translate_problems = true, ---@type boolean
			},
		},
	},
}
