local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- run :PackerCompile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {'catppuccin/nvim', as = 'catppuccin'}

  -- Tpope
  use { "tpope/vim-fugitive", event = "BufRead" }
  -- use { "tpope/vim-surround", event = "BufRead" }
  use { "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } }
  use { "tpope/vim-rhubarb" }
  -- use { "tpope/vim-unimpaired" }
  use { "tpope/vim-vinegar" }
  use { "tpope/vim-sleuth" }

  --Whichkey
  use { 'folke/which-key.nvim',
    config = function ()
      require('which-key').setup {}
    end
  }

  --Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  --Markdown preview
  use 'ellisonleao/glow.nvim'
  use 'simrat39/symbols-outline.nvim'
  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    })

  --Language packs
  use 'sheerun/vim-polyglot'

  --Nvim motions
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require'hop'.setup{ keys = 'etovxpqdgfblzhckisuran'}
    end
  }
  use { "christoomey/vim-tmux-navigator" }

  use { 'VonHeikemen/lsp-zero.nvim',
    requires = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'neovim/nvim-lspconfig'},

      --LSP autocomplete
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'honza/vim-snippets'},
    },
  }
  --Buffer navigation
  use 'nvim-lualine/lualine.nvim'

  --Haskell
  --[[ use 'neovimhaskell/haskell-vim' ]]
  --[[ use 'alx741/vim-hindent' ]]

  --debugging
  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

  --Grammar checking because I can't english
  use 'rhysd/vim-grammarous'

  --Telescope Requirements
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  --Telescope
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  --File browsing
  use 'nvim-telescope/telescope-file-browser.nvim'

  --git diff
  use 'sindrets/diffview.nvim'

  --magit
  --use 'TimUntersberger/neogit'

  -- comments
  -- use 'numToStr/Comment.nvim'
  use 'folke/todo-comments.nvim'

  --devicons
  use 'kyazdani42/nvim-web-devicons'

  --fullstack dev
  use { "puppetlabs/puppet-syntax-vim", ft = {'puppet'}, } -- Puppet syntax
  use 'pangloss/vim-javascript' --JS support
  use 'leafgarland/typescript-vim' --TS support
  use 'maxmellon/vim-jsx-pretty' --JS and JSX syntax
  use 'jparise/vim-graphql' --GraphQL syntax
  use 'mattn/emmet-vim'
end)
