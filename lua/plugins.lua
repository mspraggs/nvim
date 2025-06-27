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

	use "nvim-lua/plenary.nvim"

	use {
		"nvim-telescope/telescope.nvim",
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

	use({
		'kamykn/spelunker.vim',
	})

	use({
		'kylechui/nvim-surround',
		config = function()
			require('nvim-surround').setup({
			})
		end,
	})

	use({
		'Vimjas/vim-python-pep8-indent',
	})

	use({
		'ray-x/go.nvim',
		config = function()
			require('go').setup()
		end,
	})

	use({
		'airblade/vim-gitgutter',
	})

	use ({
		'RaafatTurki/hex.nvim',
		config = function()
			require('hex').setup()
		end,
	})

	use ({
		'folke/trouble.nvim',
		config = function ()
			require('trouble').setup {
				icons = false,
				fold_open = "v", -- icon used for open folds
				fold_closed = ">", -- icon used for closed folds
				indent_lines = false, -- add an indent guide below the fold icons
				signs = {
					-- icons / text used for a diagnostic
					error = "error",
					warning = "warn",
					hint = "hint",
					information = "info"
				},
				use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
			}
		end
	})

	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function ()
			require('plugins.harpoon')
		end
	}

	use {
		'marcuscaisey/please.nvim',
		requires = { 'nvim-treesitter/nvim-treesitter', 'mfussenegger/nvim-dap' }
	}

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			require('plugins.neo-tree')
		end,
	})

end)
