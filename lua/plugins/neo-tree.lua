return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			vim.keymap.set({ 'n' }, '<leader>nf', ':Neotree toggle reveal=true<CR>')
			
			require('neo-tree').setup({
				close_if_last_window = true,
				event_handlers = {
					{
						event = "file_opened",
						handler = function ()
							require('neo-tree.command').execute({ action = "close" })
						end,
					},
				},
				window = {
					mappings = {
						["<space>"] = {
							"toggle_node",
							nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
						},
						["gA"] = "git_add_all",
						["gu"] = "git_unstage_file",
						["ga"] = "git_add_file",
						["gr"] = "git_revert_file",
						["gc"] = "git_commit",
						["gp"] = "git_push",
						["gg"] = "git_commit_and_push"
					}
				},
			})
		end,
	},
}
