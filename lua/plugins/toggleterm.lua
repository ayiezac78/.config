vim.pack.add({
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
})

require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return math.floor(vim.o.columns * 0.4)
		end
	end,
	open_mapping = [[<C-\>]],
	direction = "vertical",
	close_on_exit = true,
	start_in_insert = true,
	hide_numbers = true,
	terminal_mappings = true,
	insert_mappings = true,
	shade_terminals = true,
})

vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set({ "n", "t" }, "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Focus left window" })
vim.keymap.set({ "n", "t" }, "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Focus right window" })
vim.keymap.set("n", "<leader>fv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle right-side terminal" })
