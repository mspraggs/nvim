-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"

	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.1",
		requires = {"nvim-lua/plenary.nvim"},
		config = function()
			require("plugins.telescope")
		end,
	}

	use {
		"folke/tokyonight.nvim",
		config = function()
			require("plugins.tokyonight")
		end,
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	}

	use {
		"mbbill/undotree",
		config = function()
			require("plugins.undotree")
		end,
	}

	use {
		"tpope/vim-fugitive",
		config = function()
			require("plugins.fugitive")
		end,
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		},
		config = function()
			require("plugins.lsp")
		end,
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = function()
			require("lualine").setup({})
		end,
	}

	use({
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end,
	})

	use({
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
	})

	use({
		'nvim-telescope/telescope-project.nvim',
	})

	use({
		'tpope/vim-sleuth',
	})

end)
