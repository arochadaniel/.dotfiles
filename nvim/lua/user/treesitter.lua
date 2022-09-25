require("nvim-treesitter.configs").setup({
	ensure_installed = { "go", "typescript", "lua" },
	sync_install = false,
	auto_install = true,
	auto_pairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
