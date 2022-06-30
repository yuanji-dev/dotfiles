-- basic mappings
vim.g.mapleader = " "
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<ESC><ESC>", ":nohlsearch<CR><Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>t", ":SymbolsOutline<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>x", ":TroubleToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>p", ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-p>", "<Plug>MarkdownPreviewToggle", { noremap = false })
