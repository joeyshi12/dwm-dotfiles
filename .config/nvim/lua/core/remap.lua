vim.g.mapleader = '\\'
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)