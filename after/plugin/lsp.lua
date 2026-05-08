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
      end,
      ["clangd"] = function()
          require("lspconfig").clangd.setup {
              capabilities = capabilities,
              cmd = {
                  "clangd",
                  "--background-index",
                  "--clang-tidy",
                  "--header-insertion=iwyu",
                  "--completion-style=detailed",
                  "--all-scopes-completion",
                  "--cross-file-rename",
                  "--pch-storage=memory",
              },
          }
      end,
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { noremap = true, silent = true, buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  end,
})
