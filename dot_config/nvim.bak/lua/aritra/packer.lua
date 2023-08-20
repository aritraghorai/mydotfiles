local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  use({ 'nvim-treesitter/playground' })

  use({ 'ThePrimeagen/harpoon' })

  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }


  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

  use "lunarvim/darkplus.nvim"

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use "lukas-reineke/indent-blankline.nvim"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use { 'nvim-tree/nvim-tree.lua' }

  use { "folke/which-key.nvim" }

  use 'famiu/bufdelete.nvim'

  use 'iamcco/markdown-preview.nvim'

  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

  use { "windwp/nvim-autopairs" }

  --AUto tag Html
  use("windwp/nvim-ts-autotag")

  use("github/copilot.vim")

  use 'NvChad/nvim-colorizer.lua'


  if packer_bootstrap then
    require('packer').sync()
  end
end)