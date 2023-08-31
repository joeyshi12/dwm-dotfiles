local lsp = require('lsp-zero')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'clangd',
  'angularls',
  'jedi_language_server',
  'jsonls',
  'java_language_server',
  'jdtls',
  'ltex'
})

lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>fs", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "nd", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "pd", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()
