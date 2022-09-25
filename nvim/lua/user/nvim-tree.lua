local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

require("nvim-tree.events").on_file_created(function(file)
	vim.cmd("edit " .. vim.fn.fnamemodify(file.fname, ":p"))
end)

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = true,
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	filters = {
		custom = { ".git" },
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
		root_folder_modifier = ":t",
		highlight_git = true,
		highlight_opened_files = "name",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "~",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	view = {
		width = 40,
		height = 40,
		hide_root_folder = true,
		side = "right",
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
		number = true,
		relativenumber = true,
	},
})
