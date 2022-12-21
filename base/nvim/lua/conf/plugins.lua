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

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use {'catppuccin/nvim', as = 'catppuccin'}
  use 'bluz71/vim-moonfly-colors'
  use 'bluz71/vim-nightfly-colors'
  use 'Mofiqul/vscode.nvim'
  use 'rose-pine/neovim'
  use 'luinnar/vim-neo-spider'
  use 'ThemerCorp/themer.lua'

  -- Colorizer
  -- use {'RRethy/vim-hexokinase', run = 'make hexokinase'}
  use {'NvChad/nvim-colorizer.lua'}

  -- Greeter
  use {'goolord/alpha-nvim'}
  use {'kyazdani42/nvim-tree.lua',
    cmd = {
      "NvimTreeToggle",
      "NvimTreeOpen",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
      "NvimTreeRefresh",
    },
  }

  -- Tpope
  use { "tpope/vim-fugitive", event = "BufRead" }
  use { 'tpope/vim-commentary', event = 'BufRead' }
  -- use { "tpope/vim-surround", event = "BufRead" }
  -- use { "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } }
  -- use { "tpope/vim-rhubarb" }
  -- use { "tpope/vim-unimpaired" }
  -- use { "tpope/vim-vinegar" }
  -- use { "tpope/vim-sleuth" }
  use {'lewis6991/gitsigns.nvim', event = 'BufRead'}
  use {'mbbill/undotree', event = 'BufReadPre'}
  use {'windwp/nvim-autopairs'}
  use { "kazhala/close-buffers.nvim", cmd = { "BDelete", "BWipeout" } }

  use {'folke/trouble.nvim'}
  use {'kylechui/nvim-surround'}

  --Whichkey
  use {'folke/which-key.nvim',}

  --Treesitter
  use {'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', event = 'BufReadPre' },
      { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'BufReadPre' },
      { 'p00f/nvim-ts-rainbow', event = 'BufReadPre' },
      { 'windwp/nvim-ts-autotag', event = 'InsertEnter' },
      { 'nvim-treesitter/nvim-treesitter-context'},
      { 'nvim-treesitter/playground', cmd = { 'TSPlaygroundToggle' }},
    },
  }
  use {'lukas-reineke/indent-blankline.nvim', event = 'BufReadPre'}

  --Markdown preview
  use 'ellisonleao/glow.nvim'
  use 'simrat39/symbols-outline.nvim'
  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    })

  --Language packs
  -- use 'sheerun/vim-polyglot'

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
  use {'nvim-lualine/lualine.nvim'}
  use {'akinsho/bufferline.nvim'}

  --debugging
  -- use 'mfussenegger/nvim-dap'
  -- use 'leoluz/nvim-dap-go'
  -- use 'rcarriga/nvim-dap-ui'
  -- use 'theHamsta/nvim-dap-virtual-text'
  -- use 'nvim-telescope/telescope-dap.nvim'

  --Grammar checking because I can't english
  use 'rhysd/vim-grammarous'

  --Telescope Requirements
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  --Telescope
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-file-browser.nvim'

  --git diff
  -- use 'sindrets/diffview.nvim'

  -- comments
  -- use 'numToStr/Comment.nvim'
  -- use 'b3nj5m1n/kommentary'
  -- use 'terrortylor/nvim-comment'
  use 'folke/todo-comments.nvim'

  --devicons
  use 'kyazdani42/nvim-web-devicons'

  --fullstack dev
  use { "puppetlabs/puppet-syntax-vim", ft = {'puppet'}, } -- Puppet syntax
  -- use 'pangloss/vim-javascript' --JS support
  -- use 'leafgarland/typescript-vim' --TS support
  -- use 'maxmellon/vim-jsx-pretty' --JS and JSX syntax
  -- use 'jparise/vim-graphql' --GraphQL syntax
  use 'mattn/emmet-vim'
end)