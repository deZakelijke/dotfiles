-- This file can be loaded by calling `lua require('plugins')` from your init.vimpac
--
-- Don't forget to install Packer first!
-- https://github.com/wbthomason/packer.nvim#quickstart

-- Only required if you have packer configured as `opt`packer
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Fuzzy searcher
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Color schemes
	use("folke/tokyonight.nvim")
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})
	use("mhartington/oceanic-next")

	-- Status bar
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")

	-- Lsp and context of local buffer
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context", { run = ":TSContextEnable" })

	-- Harpooning files
	use("nvim-lua/plenary.nvim")
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- An undo tree instead of an undo stack!
	use("mbbill/undotree")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- Comment out lines
	use("tomtom/tcomment_vim")

	-- Poetry integration, doesn't quite work
	use("petobens/poet-v")

	use("preservim/nerdtree")

	use("itchyny/lightline.vim")

	use("github/copilot.vim")

	-- nvim v0.7.2
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})

	-- Auto formatting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")

	use("heavenshell/vim-pydocstring", { run = "make install" })
end)
