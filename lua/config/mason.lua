require("mason").setup({
	ui = {
		check_outdated_packages_on_open = false, -- 启动时不检查
		automatic_installation = false, -- 关闭LSP自动安装
	},
	-- 最大并发下载数设为1（降低后台活动）
	max_concurrent_installers = 1,
})
