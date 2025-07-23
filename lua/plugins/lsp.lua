return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				build = function()
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
			local lsp = require("lsp-zero")
			local lspconfig = require("lspconfig")
			local util = require('lspconfig.util')

			lsp.preset("recommended")
			lsp.setup()

			lspconfig.gopls.setup({
				settings = {
					gopls = {
						directoryFilters = { '-plz-out' },
						linksInHover = false,
						usePlaceholders = false,
						semanticTokens = true,
						codelenses = {
							gc_details = true,
						},
					},
				},
				root_dir = function(fname)
					local gowork_or_gomod_dir = util.root_pattern('go.work', 'go.mod')(fname)
					if gowork_or_gomod_dir then
						return gowork_or_gomod_dir
					end

					local plzconfig_dir = util.root_pattern('.plzconfig')(fname)
					if plzconfig_dir and vim.fs.basename(plzconfig_dir) == 'src' then
						vim.env.GOPATH = string.format('%s:%s/plz-out/go', vim.fs.dirname(plzconfig_dir), plzconfig_dir)
						vim.env.GO111MODULE = 'off'
					end

					return vim.fn.getcwd()
				end,
			})
		end,
	},
}
