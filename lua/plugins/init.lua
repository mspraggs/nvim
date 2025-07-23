return {
	"nvim-lua/plenary.nvim",

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
		config = function()
			require("lualine").setup({})
		end,
	},

	{
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end,
	},

	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
	},

	{
		'nvim-telescope/telescope-project.nvim',
	},

	{
		'tpope/vim-sleuth',
	},

	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup {
				-- your config goes here
				-- or just leave it empty :)
			}
		end,
	},

	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	build = function() vim.fn["mkdp#util#install"]() end,
	-- },

	{
		'kamykn/spelunker.vim',
	},

	{
		'kylechui/nvim-surround',
		config = function()
			require('nvim-surround').setup({
			})
		end,
	},

	{
		'Vimjas/vim-python-pep8-indent',
	},

	{
		'ray-x/go.nvim',
		config = function()
			require('go').setup()
		end,
	},

	{
		'airblade/vim-gitgutter',
	},

	{
		'RaafatTurki/hex.nvim',
		config = function()
			require('hex').setup()
		end,
	},

	{
		'marcuscaisey/please.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'mfussenegger/nvim-dap' }
	},

}
