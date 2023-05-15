-- This file can be loaded by calling `lua require("plugins")` from your init.vim
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
	vim.cmd.packadd('packer.nvim')
end

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

	use({
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup {
				-- your config goes here
				-- or just leave it empty :)
			}
		end,
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

end)
