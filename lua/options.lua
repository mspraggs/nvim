vim.o.number = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.opt.listchars:append({ space = '-' })
vim.o.list = true

vim.o.colorcolumn = "80,100"

vim.o.spell = false

vim.o.textwidth = 80

vim.opt.clipboard = "unnamedplus"
vim.wo.relativenumber = true

vim.cmd[[colorscheme tokyonight-night]]

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

