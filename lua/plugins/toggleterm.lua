vim.pack.add({
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
})

require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<C-\>]],
	hide_numbers = true,
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	direction = "float", -- "float", "horizontal", "vertical", or "tab"
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "rounded",
		winblend = 0,
	},
})

-- keybindings

-- Exit terminal insert mode easily with Esc Esc (keeps single Esc working for zsh/vim vi-mode)
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Seamless window navigation while inside a split terminal
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move to left window" })
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move to lower window" })
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move to upper window" })
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move to right window" })

-- Additional layout toggles
vim.keymap.set("n", "<leader>ft", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle floating terminal" })
vim.keymap.set("n", "<leader>fh", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle horizontal terminal" })
vim.keymap.set("n", "<leader>fv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle vertical terminal" })
