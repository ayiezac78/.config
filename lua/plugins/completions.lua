vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if (name == "blink.cmp" or name == "blink.lib") and (kind == "install" or kind == "update") then
			vim.cmd.packadd("blink.lib")
			vim.cmd.packadd("blink.cmp")
			require("blink.cmp").build():pwait()
		end
	end,
})

vim.pack.add({
	"https://github.com/saghen/blink.cmp",
	"https://github.com/saghen/blink.lib",
	"https://github.com/rafamadriz/friendly-snippets",
})

require("blink.cmp").setup({
	signature = {
		enabled = true,
	},
	keymap = {
		preset = "default",
		["<Tab>"] = { "accept", "fallback" },
		["<C-Space>"] = { "show" },
		["J"] = { "select_next", "fallback" },
		["K"] = { "select_prev", "fallback" },
	},
	fuzzy = {
		implementation = "rust",
	},
	completion = {
		ghost_text = {
			enabled = true,
		},
		menu = {
			auto_show = true,
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
	},
	cmdline = {
		keymap = { preset = "inherit" },
		completion = { menu = { auto_show = true } },
	},
})
