require("impatient")

require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.telescope")
require("user.treesitter")
require("user.cmp")
require("user.lsp")
require("user.autopairs")
require("user.gitsigns")
require("user.nvim-tree")
require("user.nvim-scrollbar")

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
