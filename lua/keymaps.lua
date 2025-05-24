vim.keymap.set("n", "<leader>w", '<cmd>w!<cr>')
vim.keymap.set("n", "<leader>e", '<cmd> NvimTreeToggle <CR>')

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<leader>bd", '<cmd>bd<cr>')
