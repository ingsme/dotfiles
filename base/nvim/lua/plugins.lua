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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use { "lewis6991/impatient.nvim" }
  use { "wbthomason/packer.nvim" }-- Have packer manage itself

  -- Tpope
  use { "tpope/vim-fugitive", event = "BufRead" }
  use { "tpope/vim-surround", event = "BufRead" }
  use { "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } }
  use { "tpope/vim-rhubarb" }
  use { "tpope/vim-unimpaired" }
  use { "tpope/vim-vinegar" }
  use { "tpope/vim-sleuth" }

  use { "nvim-lua/popup.nvim" }-- An implementation of the Popup API from vim in Neovim
  use { "nvim-lua/plenary.nvim" }-- Useful lua functions used ny lots of plugins
  use { "windwp/nvim-autopairs",-- Autopairs, integrates with both cmp and treesitter
    config = function()
      require("config.autopairs")
    end,
  }
  use { "max397574/better-escape.nvim",
    event = "VimEnter",
    config = function()
      require("better_escape").setup()
    end,
  }
  use { "numToStr/Comment.nvim", -- Easily comment stuff
    config = function()
      require("config.comment")
    end,
  }
  use { "christoomey/vim-tmux-navigator" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "kyazdani42/nvim-tree.lua",
    config = function ()
      require("config.nvim-tree")
    end,
  }
  use { "akinsho/bufferline.nvim",
    config = function()
      require("config.bufferline")
    end,
  }
  use { "moll/vim-bbye" }
  -- use { "nvim-lualine/lualine.nvim" }
  use { "NTBBloodbath/galaxyline.nvim",
    config = function()
      require("config.galaxyline")
    end,
  }
  use { "akinsho/toggleterm.nvim",
    config = function ()
      require("config.toggleterm")
    end,
  }
  use { "ahmedkhalf/project.nvim",
    config = function ()
      require("config.project")
    end,
  }
  use { "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("config.indentline")
    end,
  }
  use { "goolord/alpha-nvim",
    config = function()
      require("config.alpha")
    end,
  }
  use { "antoinemadec/FixCursorHold.nvim" }-- This is needed to fix lsp doc highlight
  use { "folke/which-key.nvim",
    config = function ()
      require("config.whichkey")
    end,
  }

  -- Colorschemes
  -- use { "lunarvim/colorschemes" }-- A bunch of colorschemes you can try out
  use { "lunarvim/darkplus.nvim",
    config = function ()
      vim.cmd "colorscheme darkplus"
    end,
  }
  use { "ingsme/nvim-smyck" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", -- The completion plugin
    --event = "InsertEnter",
    --opt = true,
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "octaltree/cmp-look",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-calc",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-emoji",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
    },
    config = function()
      require("config.cmp")
    end,
  }

  -- snippets
  use { "L3MON4D3/LuaSnip" }--snippet engine
  use { "honza/vim-snippets" }
  -- use { "rafamadriz/friendly-snippets" }-- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig" }-- enable LSP
  use { "williamboman/nvim-lsp-installer" }-- simple to use language server installer
  use { "tamago324/nlsp-settings.nvim" }-- language server settings defined in json for
  use { "b0o/SchemaStore.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" }-- for formatters and linters
  use { "SmiteshP/nvim-gps",
    config = function()
      require("config.gps")
    end,
    requires = 'nvim-treesitter'
  }

  -- Telescope
  use { "nvim-telescope/telescope.nvim",
    -- module = "telescope",
    -- as = "telescope",
    requires = {
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-github.nvim",
      "fhill2/telescope-ultisnips.nvim",
      "cljoly/telescope-repo.nvim",
      "jvgrootveld/telescope-zoxide",
      "dhruvmanila/telescope-bookmarks.nvim",
      -- 'nvim-telescope/telescope-hop.nvim'
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-arecibo.nvim", rocks = { "openssl", "lua-http-parser" }, },
      { "nvim-telescope/telescope-frecency.nvim", requires = { "tami5/sql.nvim" }, },
      { "nvim-telescope/telescope-vimspector.nvim", event = "BufWinEnter", },
      { "nvim-telescope/telescope-dap.nvim" },
    },
    config = function()
      require("config.telescope")
    end,
  }

  use { "rcarriga/nvim-notify",
    event = "VimEnter",
    config = function()
      vim.notify = require "notify"
    end,
  }


  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("config.treesitter")
    end,
    requires = {
      { "jose-elias-alvarez/nvim-lsp-ts-utils" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      { "p00f/nvim-ts-rainbow" },
      { "nvim-treesitter/playground", cmd = "TSHighlightCapturesUnderCursor", },
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "RRethy/nvim-treesitter-textsubjects" },
      { "windwp/nvim-autopairs",
        run = "make",
        config = function()
          require("nvim-autopairs").setup {}
        end,
      },
      { "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-ts-autotag").setup { enable = true }
        end,
      },
      { "romgrk/nvim-treesitter-context",
        config = function()
          require("treesitter-context.config").setup { enable = true }
        end,
      },
      { "mfussenegger/nvim-ts-hint-textobject",
        config = function()
          vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
          vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
        end,
      },
    },
  }

  -- Puppet highlighting
  use { "puppetlabs/puppet-syntax-vim" }

  -- Git
  use { "lewis6991/gitsigns.nvim",
    -- event = "BufReadPre",
    -- wants = "plenary.nvim",
    -- requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  }

  -- Misc
  use { "luizribeiro/vim-cooklang" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
