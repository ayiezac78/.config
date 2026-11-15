vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/leoluz/nvim-dap-go",
})

local dap, dapui = require("dap"), require("dapui")

require("dap-go").setup() -- uses the dlv on your PATH
dapui.setup()

-- open/close the UI automatically with a debug session
dap.listeners.after.event_initialized["dapui"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui"] = function()
	dapui.close()
end

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: continue / start" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP: step over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: step into" })
vim.keymap.set("n", "<leader>dt", require("dap-go").debug_test, { desc = "DAP: debug nearest Go test" })
