vim.lsp.config("tsc", {
	cmd = function(dispatchers, config)
		local root = config.root_dir or vim.fn.getcwd()
		return vim.lsp.rpc.start({ root .. "/node_modules/.bin/tsc", "--lsp", "--stdio" }, dispatchers, { cwd = root })
	end,
})

vim.lsp.enable("ts_ls", false)
