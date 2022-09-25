local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Package manager

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- Colorscheme
	use({ "ellisonleao/gruvbox.nvim" })

	use("kyazdani42/nvim-web-devicons")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use({ "hrsh7th/cmp-buffer", requires = { "hrsh7th/nvim-cmp" } }) -- buffer completions
	use({ "hrsh7th/cmp-path", requires = { "hrsh7th/nvim-cmp" } }) -- path completions
	use({ "hrsh7th/cmp-cmdline", requires = { "hrsh7th/nvim-cmp" } }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip", requires = { "hrsh7th/nvim-cmp" } }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", requires = { "hrsh7th/nvim-cmp" } })
	use({ "hrsh7th/cmp-nvim-lua", requires = { "hrsh7th/nvim-cmp" } })

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("glepnir/lspsaga.nvim")

	-- Necessary for Live Grep in telescope (<leader>fg)
	use("BurntSushi/ripgrep")

	-- FuzzyFinder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" }, { "BurntSushi/ripgrep" } },
	})

	-- Status bar on the bottom of the editor
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Autopairs on things like {}, (), []
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- LSP injection
	use("jose-elias-alvarez/null-ls.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Improves startup time
	use("lewis6991/impatient.nvim")

	-- File explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- Renaming, highlighting for treesitter
	use("nvim-treesitter/nvim-treesitter-refactor")

	-- Commenting
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Commenting base on file context
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Tab-like experience for buffers
	use("akinsho/bufferline.nvim")

	-- Better buffer closing
	use("moll/vim-bbye")

	-- Git handler
	use("tpope/vim-fugitive")

	-- Scrollbar with diagnostics
	use("petertriho/nvim-scrollbar")

	-- Project handler
	use("ahmedkhalf/project.nvim")

	-- Sqlite
	use({ "kkharji/sqlite.lua" })
end)
