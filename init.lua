require("config")
require("plugins")

-- golang gotmpl
vim.filetype.add({
	extension = {
		gotmpl = "gotmpl",
		tmpl = "gotmpl",
		gohtml = "gotmpl",
	},
})
