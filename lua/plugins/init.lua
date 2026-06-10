return {
  { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    init = function()
      local parser_dir = vim.fn.stdpath('data') .. '/site/parser'
      vim.opt.runtimepath:prepend(parser_dir)
    end,
    opts = function()
      local uv = vim.uv or vim.loop
      local max_filesize = 1024 * 1024 -- 1 MB
      local parser_dir = vim.fn.stdpath('data') .. '/site/parser'

      return {
        parser_install_dir = parser_dir,
        ensure_installed = { 'bash', 'c', 'cpp', 'json', 'lua', 'markdown', 'python', 'query', 'vim', 'vimdoc', 'yaml' },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = function(lang, buf)
            local name = vim.api.nvim_buf_get_name(buf)
            if name ~= '' then
              local ok, stats = pcall(uv.fs_stat, name)
              if ok and stats and stats.size and stats.size > max_filesize then
                return true
              end
            end

            local ok = pcall(vim.treesitter.get_parser, buf, lang)
            return not ok
          end,
        },
      }
    end,
  },
  { 'duane9/nvim-rg' },
  { 'nvim-lualine/lualine.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'nvim-tree/nvim-tree.lua' },
  { 'neovim/nvim-lspconfig' },
  { 'mason-org/mason.nvim' },
  { 'mason-org/mason-lspconfig.nvim' },
  { 'rebelot/kanagawa.nvim', name = "kanagawa" },
  { 'catppuccin/nvim', name = "catppuccin" },
  { 'f-person/git-blame.nvim' },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },
  { 'lewis6991/gitsigns.nvim' },
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  { 'numToStr/Comment.nvim', opts = {} },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },

    opts = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      return {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),

          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      }
    end,
  },
}

