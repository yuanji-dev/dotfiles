-- basic settings
vim.o.ignorecase = true
vim.o.number = true
vim.o.expandtab = true
vim.o.fileencodings = "ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.colorcolumn = "100"
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.autowrite = true
vim.o.guifont = "CaskaydiaCove Nerd Font Mono"
-- format on save
vim.cmd([[autocmd BufWritePre *.go,*.md,*.lua,*.yml,*.yaml,*.json lua vim.lsp.buf.formatting_sync(nil, 1000)]])
vim.cmd([[au BufNewFile,BufRead *.Jenkinsfile setf groovy]])