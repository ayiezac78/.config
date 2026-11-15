vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")
harpoon:setup()

-- Highlight the currently open file in Harpoon's list.
harpoon:extend(require("harpoon.extensions").builtins.highlight_current_file())

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "Harpoon: add current file" })

vim.keymap.set("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon: open file list" })

for i = 1, 4 do
	vim.keymap.set("n", "<leader>" .. i, function()
		harpoon:list():select(i)
	end, { desc = "Harpoon: jump to file " .. i })
end

vim.keymap.set("n", "<leader>hp", function()
	harpoon:list():prev()
end, { desc = "Harpoon: previous file" })

vim.keymap.set("n", "<leader>hn", function()
	harpoon:list():next()
end, { desc = "Harpoon: next file" })
