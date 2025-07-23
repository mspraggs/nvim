return {
	{
		'folke/trouble.nvim',
		config = function ()
			require('trouble').setup {
				icons = false,
				fold_open = "v", -- icon d for open folds
				fold_closed = ">", -- icon d for closed folds
				indent_lines = false, -- add an indent guide below the fold icons
				signs = {
					-- icons / text d for a diagnostic
					error = "error",
					warning = "warn",
					hint = "hint",
					information = "info"
				},
				_diagnostic_signs = false -- enabling this will the signs defined in your lsp client
			}

			local trouble = require("trouble.sources.telescope")

			local telescope = require("telescope")

			telescope.setup {
				defaults = {
					mappings = {
						i = { ["<c-t>"] = trouble.open },
						n = { ["<c-t>"] = trouble.open },
					},
				},
			}
		end
	},
}
