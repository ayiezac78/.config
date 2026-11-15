vim.pack.add({
	{ src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/antoinemadec/FixCursorHold.nvim" },
	-- Language & framework adapters
	{ src = "https://github.com/marilari88/neotest-vitest" },
	{ src = "https://github.com/thenbe/neotest-playwright" },
	{ src = "https://github.com/fredrikaverpil/neotest-golang" },
	{ src = "https://github.com/nvim-neotest/neotest-python" },
})

require("neotest").setup({
	adapters = {
		require("neotest-vitest"),
		require("neotest-playwright").adapter({
			options = {
				persist_project_selection = true,
				enable_dynamic_test_discovery = true,
			},
		}),
		require("neotest-golang"),
		require("neotest-python")({
			runner = "pytest",
		}),
	},
})

-- keybindings
local neotest = require("neotest")

vim.keymap.set("n", "<leader>tr", function()
	neotest.run.run()
end, { desc = "Run nearest test" })

vim.keymap.set("n", "<leader>tf", function()
	neotest.run.run(vim.fn.expand("%"))
end, { desc = "Run current test file" })

vim.keymap.set("n", "<leader>ts", function()
	neotest.summary.toggle()
end, { desc = "Toggle test summary tree" })

vim.keymap.set("n", "<leader>to", function()
	neotest.output.open({ enter = true, auto_close = true })
end, { desc = "Show test output" })

vim.keymap.set("n", "<leader>tO", function()
	neotest.output_panel.toggle()
end, { desc = "Toggle test output panel" })

vim.keymap.set("n", "<leader>tS", function()
	neotest.run.stop()
end, { desc = "Stop running test" })
