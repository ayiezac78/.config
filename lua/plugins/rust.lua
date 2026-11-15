vim.pack.add({
	{
		src = "https://github.com/mrcjkb/rustaceanvim",
		version = vim.version.range("^9"),
	},
	"https://github.com/saecki/crates.nvim",
	"https://github.com/cordx56/rustowl",
})

vim.g.rustaceanvim = {
	server = {
		default_settings = {
			["rust-analyzer"] = {
				check = {
					command = "clippy",
				},
			},
		},
	},
}

-- rustowl
require("rustowl").setup({
	auto_attach = true,
	auto_enable = true,
})
require("crates").setup()
