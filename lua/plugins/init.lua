return {
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-treesitter/playground' },
  { 'duane9/nvim-rg' },
  { 'nvim-lualine/lualine.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'nvim-tree/nvim-tree.lua' },
  { 'neovim/nvim-lspconfig' },
  { 'mason-org/mason.nvim' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip' },
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
}

