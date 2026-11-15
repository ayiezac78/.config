vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/meanderingprogrammer/render-markdown.nvim" },
})

-- files that mark a project as using biome
local biome_config = {
	"biome.json",
	"biome.jsonc",
	".biome.json",
	".biome.jsonc",
}

-- json/css/graphql: biome in biome projects, prettierd otherwise
local function prettier_or_biome(bufnr)
	if vim.fs.root(bufnr, biome_config) then
		return { "biome-check" }
	end
	return { "prettierd" }
end

require("conform").setup({
	format_on_save = {
		timeout_ms = 8000,
		lsp_format = "fallback",
	},

	formatters_by_ft = {
		lua = { "stylua" },

		-- biome everywhere for js/ts
		javascript = { "biome-check" },
		javascriptreact = { "biome-check" },
		typescript = { "biome-check" },
		typescriptreact = { "biome-check" },
		vue = { "biome-check" },
		astro = { "biome-check" },

		-- biome-aware so two tools don't fight over the same project
		json = prettier_or_biome,
		jsonc = prettier_or_biome,
		graphql = prettier_or_biome,
		css = prettier_or_biome,

		-- prettier only
		html = { "prettierd" },
		markdown = { "prettierd" },
		yaml = { "prettierd" },

		go = { "goimports", "gofumpt" },
		sh = { "shfmt" },
		sql = { "sql_formatter" },
		python = { "ruff_organize_imports", "ruff_format" },
		rust = { "rustfmt" },
	},

	formatters = {
		sql_formatter = {
			prepend_args = { "--language", "postgresql" },
		},
	},
})

-- biome LSP for linting, attached in every js/ts project (not just ones with biome.json)
vim.lsp.config("biome", {
	root_dir = function(bufnr, on_dir)
		on_dir(vim.fs.root(bufnr, { "biome.json", "biome.jsonc", "package.json", ".git" }) or vim.fn.getcwd())
	end,
})
