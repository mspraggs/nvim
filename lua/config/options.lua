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

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})
