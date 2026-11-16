vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-mini/mini.align" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-mini/mini.indentscope" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/nvim-mini/mini.jump" },
	{ src = "https://github.com/nvim-mini/mini.splitjoin" },
	{ src = "https://github.com/nvim-mini/mini.hipatterns" },
	{ src = "https://github.com/nvim-mini/mini.files" },
	{ src = "https://github.com/nvim-mini/mini.extra" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
})

-- mini files ----
local MiniFiles = require("mini.files")
MiniFiles.setup({
	mappings = {
		go_in = "<CR>",
		go_in_plus = "L",
		go_out = "_",
		go_out_plus = "H",
	},
})

vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
vim.keymap.set("n", "<leader>-", function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
	MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

vim.keymap.set("n", "<leader>e", function()
	if vim.bo.filetype == "minifiles" then
		require("mini.files").close()
	else
		require("mini.files").open(vim.api.nvim_buf_get_name(0))
	end
end, { desc = "Toggle mini.files" })

--- mini picker ---
local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")
MiniPick.setup()
MiniExtra.setup()

-- keymaps
vim.keymap.set("n", "<leader>pf", function()
	MiniPick.builtin.files()
end, { desc = "Mini File Picker" })
vim.keymap.set("n", "<leader>ps", function()
	MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end, { desc = "Grep word/Search word" })
vim.keymap.set("n", "<leader>vh", function()
	MiniPick.builtin.help()
end, { desc = "Mini Help" })

vim.keymap.set("n", "<leader>xx", function()
	MiniExtra.pickers.diagnostic()
end, { desc = "Mini Picker Diagnostics" })
vim.keymap.set("n", "<leader>pk", function()
	MiniExtra.pickers.keymaps()
end, { desc = "Search keymaps" })

local ai = require("mini.ai")
ai.setup({
	-- treesitter textobjects af/if function, ac/ic class
	custom_textobjects = {
		f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
		c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
	},
})

require("mini.align").setup()

require("mini.indentscope").setup({
	symbol = "│",
	draw = {
		animation = require("mini.indentscope").gen_animation.none(),
	},
})

-- auto pairs
require("mini.pairs").setup()

-- access to surround keymaps sa,sd,sc etc
require("mini.surround").setup()

-- icons, replace nvim_web_devicons
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

-- better jump capabilities
require("mini.jump").setup()

-- toggle formatting of brackets
require("mini.splitjoin").setup({
	mappings = {
		toggle = "<leader>m",
	},
})

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		hex_color = hipatterns.gen_highlighter.hex_color(),
		fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
		hack = { pattern = "HACK", group = "MiniHipatternsHack" },
		todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
		note = { pattern = "NOTE", group = "MiniHipatternsNote" },
	},
})
