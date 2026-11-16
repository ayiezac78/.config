vim.pack.add({
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({
	close_if_last_window = false,
	enable_git_status = true,
	enable_diagnostics = true,
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = false,
		},
		follow_current_file = {
			enabled = true,
		},
		use_libuv_file_watcher = true,
	},
	window = {
		position = "left",
		width = 32,
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree filesystem toggle<cr>", {
	desc = "Toggle Neo-tree file explorer",
})
