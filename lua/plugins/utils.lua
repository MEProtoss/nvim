local leet_arg = "leetcode.nvim"
return {
	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			-- You can choose one of the following pickers
			"nvim-telescope/telescope.nvim",
			"ibhagwan/fzf-lua",
			"echasnovski/mini.pick",
			"folke/snacks.nvim",
		},
		config = function(_, opts)
			require("live-preview").setup(opts)
			-- 添加自动保存配置
			--- Lua
			vim.o.autowriteall = true
			vim.api.nvim_create_autocmd({ "InsertLeavePre", "TextChanged", "TextChangedP" }, {
				pattern = "*.html",
				callback = function()
					vim.cmd("silent! write")
				end,
			})
		end,
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

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = 15,
			direction = "float", -- 浮动终端
			shell = vim.o.shell, -- 继承系统默认 shell
		},
	},

	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		lazy = leet_arg ~= vim.fn.argv()[1],
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
			arg = leet_arg,
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
