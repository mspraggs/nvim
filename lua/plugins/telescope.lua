return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {"nvim-lua/plenary.nvim"},
		config = function()
			local telescope = require('telescope')
			telescope.load_extension('project')
			vim.keymap.set('n', '<leader>lp', telescope.extensions.project.project, {})

			local builtin = require('telescope.builtin')
			local utils = require("telescope.utils")
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fd', function() builtin.find_files({ cwd = utils.buffer_dir() }) end, {})
			vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fr', ':Telescope oldfiles<CR>', { noremap = true, silent = true })
		end,
	},
}
