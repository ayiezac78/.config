vim.keymap.set("n", "<leader>rr", function()
	vim.cmd.RustLsp("runnables")
end, { buffer = true, desc = "Rust: run target" })

vim.keymap.set("n", "<leader>rt", function()
	vim.cmd.RustLsp("testables")
end, { buffer = true, desc = "Rust: run tests" })

vim.keymap.set("n", "<leader>ca", function()
	vim.cmd.RustLsp("codeAction")
end, { buffer = true, desc = "Rust: code actions" })

vim.keymap.set("n", "K", function()
	vim.cmd.RustLsp({ "hover", "actions" })
end, { buffer = true, desc = "Rust: hover actions" })
