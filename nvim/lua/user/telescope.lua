require("telescope").setup({
	pickers = {
		find_files = {
			no_ignore = true,
		},
	},
})

require("telescope").load_extension("projects")
