require('mason').setup({})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('mason-lspconfig').setup({
  ensure_installed = { "lua_ls", "pyright", "ts_ls", "clangd", "rust_analyzer"},
  automatic_installation = true,
  handlers = {
      function(server_name)
          require("lspconfig")[server_name].setup {
              capabilities = capabilities,
          }
      end
  },
})
local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)


require('cmp').setup {
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
}
