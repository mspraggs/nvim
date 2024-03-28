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
