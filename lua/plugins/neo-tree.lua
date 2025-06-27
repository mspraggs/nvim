vim.keymap.set({ 'n' }, '<leader>nf', ':Neotree toggle<CR>')

require('neo-tree').setup({
	close_if_last_window = true,
	event_handlers = {
		{
			event = "file_opened",
			handler = function ()
				require('neo-tree.command').execute({ action = "close" })
			end,
		},
	}
})
