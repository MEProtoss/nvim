-- keymaps.lua 在 Lazy.nvim 启动之前自动加载。
-- 始终设置的默认按键映射: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- 在此添加其他按键映射
local map = vim.keymap.set

-- 根据文件类型运行当前文件
local function get_run_cmd()
	local ft = vim.bo.filetype
	local file = vim.fn.expand("%")
	local base = vim.fn.expand("%:r")

	-- 按文件类型返回对应命令
	local cmds = {
		c = "gcc " .. file .. " -o " .. base .. " && ./" .. base,
		cpp = "g++ " .. file .. " -o " .. base .. " && ./" .. base,
		python = "python " .. file,
		java = "javac " .. file .. " && java " .. base,
		go = "go run " .. file,
		rust = "cargo run",
		javascript = "node " .. file,
		typescript = "ts-node " .. file,
	}
	return cmds[ft] or nil
end

vim.keymap.set("n", "<leader>rr", function()
	local cmd = get_run_cmd()
	if cmd then
		require("toggleterm").exec(cmd, 1) -- 在浮动终端执行
	else
		vim.notify("Unsupported  filetype: " .. vim.bo.filetype, vim.log.levels.WARN)
	end
end, { desc = "Run current file in toggleterm" })

-- 向右移动光标
map("i", "<A-a>", "<right>", { desc = "向右移动一格光标", noremap = true })
-- 复制当前行
map("i", "<C-d>", "<esc>yyp$a", { desc = "复制当前行", noremap = true })
map("n", "<C-d>", "<esc>yyp$a", { desc = "复制当前行", noremap = true })
-- 退格键快速删除
map("n", "<bs>", '"_ciw', { desc = "快速删除", noremap = true })
-- 全选
map("n", "<A-a>", "ggVG", { desc = "全选", noremap = true })

-- 插入行
map("i", "<A-o>", "<esc>o", { desc = "向下插入行", noremap = true })
map("i", "<A-S-o>", "<esc>O", { desc = "向下插入行", noremap = true })

-- VISUAL SELECT模式 s-tab tab左右缩进
map("v", "<S-Tab>", "<gv", { desc = "左缩进", noremap = true })
map("v", "<Tab>", ">gv", { desc = "右缩进", noremap = true })

-- <c-a> <c-e> 映射为home和end
map("n", "<c-a>", "^", { desc = "home", noremap = true })
map("n", "<c-e>", "$", { desc = "end", noremap = true })

-- 重写shift+方向键 快速选中
map("v", "<s-right>", "e", { desc = "选中向右", noremap = true })
map("i", "<s-right>", "<esc>ea", { desc = "选中向右", noremap = true })

-- 打断
map("n", "<c-j>", "f,a<cr><esc>", { desc = "打断", noremap = true })

-- VISUAL SELECT模式 s-tab tab左右缩进
map("v", "<S-Tab>", "<gv", { desc = "左缩进", noremap = true })
map("v", "<Tab>", ">gv", { desc = "右缩进", noremap = true })

-- SHIFT + 方向 选择文本
map("i", "<s-up>", "<esc>vkl", { desc = "选择上", noremap = true })
map("i", "<s-down>", "<esc>lvjh", { desc = "选择下", noremap = true })
map("n", "<s-up>", "Vk", { desc = "选择上", noremap = true })
map("n", "<s-down>", "Vj", { desc = "选择下", noremap = true })
map("v", "<s-down>", "k", { desc = "选择下", noremap = true })
map("v", "<s-up>", "j", { desc = "选择上", noremap = true })
map("n", "<s-left>", "<left>vh", { desc = "选择左", noremap = true })
map("n", "<s-right>", "vl", { desc = "选择右", noremap = true })

-- CTRL SHIFT + 方向 快速跳转
map("n", "<c-s-up>", "10k", { desc = "快速跳转上", noremap = true })
map("n", "<c-s-down>", "10j", { desc = "快速跳转下", noremap = true })
map("v", "<c-s-up>", "10k", { desc = "快速跳转上", noremap = true })
map("v", "<c-s-down>", "10j", { desc = "快速跳转下", noremap = true })

-- 普通模式下 - 折叠代码块
map("n", "-", "za", { desc = "折叠代码块", noremap = true })

-- 在可视模式下切换驼峰命名法
vim.api.nvim_set_keymap("v", "T", ":lua MagicToggleHump(true)<CR>", { noremap = true, silent = true })

-- 在可视模式下切换下划线命名法
vim.api.nvim_set_keymap("v", "t", ":lua MagicToggleHump(false)<CR>", { noremap = true, silent = true })

-- 在 normal 模式中使用 Tab 键实现光标跳转
vim.api.nvim_set_keymap("n", "<Tab>", ":lua MagicMove()<CR>", { noremap = true, silent = true })
-- 在 normal 模式中按 0 键跳转到行首
vim.api.nvim_set_keymap("n", "0", "%", { noremap = true })
-- 在 visual 模式中按 0 键跳转到行首
vim.api.nvim_set_keymap("v", "0", "%", { noremap = true })

-- Rnvimr插件
-- 在插入模式下使用 Alt + i 调整 Rnvimr 大小
vim.api.nvim_set_keymap("t", "<M-i>", "<C-\\><C-n>:RnvimrResize<CR>", { silent = true })
-- 在普通模式下使用 Alt + o 切换 Rnvimr 显示
vim.api.nvim_set_keymap("n", "<M-o>", ":RnvimrToggle<CR>", { silent = true })
-- 在 Rnvimr 中使用 Alt + o 切换显示
vim.api.nvim_set_keymap("t", "<M-o>", "<C-\\><C-n>:RnvimrToggle<CR>", { silent = true })
-- 开关ChatGPTEditWithInstructions快捷键
vim.api.nvim_set_keymap("n", "<C-c>", ":ChatGPTEditWithInstructions<CR>", { desc = "打开chatgpt", silent = true })
-- 打开chatgpt快捷键
vim.api.nvim_set_keymap("n", "<C-g>", ":ChatGPT<CR>", { desc = "打开chatgpt", silent = true })

-- 驼峰转换函数 MagicToggleHump(true) 首字母大写 MagicToggleHump(false) 首字母小写
function MagicToggleHump(upperCase)
	vim.fn.execute('normal! gv"tx')
	local w = vim.fn.getreg("t")
	local toHump = w:find("_") ~= nil
	if toHump then
		w = w:gsub("_(%w)", function(c)
			return c:upper()
		end)
	else
		w = w:gsub("(%u)", function(c)
			return "_" .. c:lower()
		end)
	end
	if w:sub(1, 1) == "_" then
		w = w:sub(2)
	end
	if upperCase then
		w = w:sub(1, 1):upper() .. w:sub(2)
	end
	vim.fn.setreg("t", w)
	vim.fn.execute('normal! "tP')
end

-- 光标在行首或行尾跳转函数
function MagicMove()
	local first = 1
	local head = #vim.fn.getline(".") - #vim.fn.substitute(vim.fn.getline("."), "^\\s*", "", "G") + 1
	local before = vim.fn.col(".")
	if before == first then
		if first ~= head then
			vim.cmd("norm! ^")
		end
	else
		vim.cmd("norm! $")
	end
	local after = vim.fn.col(".")
	if before == after then
		vim.cmd("norm! 0")
	end
end
