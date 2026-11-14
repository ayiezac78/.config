require("mason").setup()

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Local buffer" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Local buffer" })
vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

vim.diagnostic.config({ virtual_text = true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

local vue_ls_path = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_ls_path,
	languages = { "vue" },
	configNamespace = "typescript"
}

vim.lsp.config("vtsls", {
	settings = {
		vstls = {
			tsserver = {
				globalPlugins = {
					vue_plugin
				},
			}
		},
	},
	filetypes = {
		"javascript", "javascriptreact",
		"typescript", "typescriptreact",
		"vue"
	}
})

vim.lsp.enable({
	"lua_ls",
	"vtsls",
	"vue_ls",
	"marksman",
	"gopls",
	"rust_analyzer",
	"pylsp",
	"astro",
	"biome",
})
