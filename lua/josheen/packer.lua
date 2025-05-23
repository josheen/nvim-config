vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('duane9/nvim-rg')
  use('nvim-lualine/lualine.nvim')
  use('nvim-tree/nvim-web-devicons')
  use('nvim-tree/nvim-tree.lua')
  use('neovim/nvim-lspconfig')
  use('mason-org/mason.nvim')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')
  use('L3MON4D3/LuaSnip')
  use('mason-org/mason-lspconfig.nvim')
  use('rebelot/kanagawa.nvim')
  use('catppuccin/nvim')
  use('f-person/git-blame.nvim')
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
 }
  use('lewis6991/gitsigns.nvim')
end)
