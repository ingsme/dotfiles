------------------------------------------------------
-- Plugins
------------------------------------------------------

-- Install Plug if it is not installed
local install_path = vim.fn.stdpath("config") .. "/autoload/plug.vim"
local execute = vim.api.nvim_command
local fn = vim.fn

if fn.empty(fn.glob(install_path)) > 0 then
	execute(
		"!curl -fLo "
			.. install_path
			.. " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	)
end

local Plug = fn["plug#"]
local plugpath = fn.stdpath("config") .. "/plugged"

vim.call("plug#begin", plugpath)

--Status- and bufferline
Plug('nvim-lualine/lualine.nvim')
Plug('arkav/lualine-lsp-progress')
Plug("akinsho/bufferline.nvim")

-- Misc
Plug("christoomey/vim-tmux-navigator")
Plug('wellle/targets.vim')
Plug("nvim-lua/plenary.nvim")
Plug("kyazdani42/nvim-web-devicons")
Plug('tpope/vim-fugitive')
Plug("lewis6991/gitsigns.nvim")
Plug("Yggdroot/indentLine")
Plug("windwp/nvim-autopairs")
Plug("rafi/vim-tinycomment")
Plug('numToStr/Comment.nvim')
Plug('norcalli/nvim-colorizer.lua')
Plug('tpope/vim-repeat')

-- File Explorer
Plug("kyazdani42/nvim-tree.lua")

-- Treesitter
Plug("nvim-treesitter/nvim-treesitter", {['run'] = ':TSUpdate'})
Plug('nvim-treesitter/nvim-treesitter-refactor')
Plug('nvim-treesitter/nvim-treesitter-textobjects')
Plug('nvim-treesitter/playground')
Plug('JoosepAlviste/nvim-ts-context-commentstring')
Plug('p00f/nvim-ts-rainbow')

-- Telescope
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "make" })
Plug("xiyaowong/telescope-emoji.nvim")

-- LSP
Plug("neovim/nvim-lspconfig")
Plug('onsails/lspkind-nvim')
Plug('nvim-lua/lsp-status.nvim')
Plug('folke/lsp-colors.nvim')
Plug('folke/trouble.nvim')
Plug("williamboman/nvim-lsp-installer")

-- Completion
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-emoji")
Plug('hrsh7th/cmp-cmdline')
Plug('SirVer/ultisnips')
Plug('quangnguyen30192/cmp-nvim-ultisnips')
Plug('honza/vim-snippets')
Plug("ray-x/cmp-treesitter")

-- Other languages
Plug("PotatoesMaster/i3-vim-syntax", { ["for"] = "i3" })
Plug("puppetlabs/puppet-syntax-vim", { ["for"] = "puppet" })
-- Plug("rodjek/vim-puppet", { ["for"] = "puppet" })

-- Colorcheme
Plug("brendonrapp/smyck-vim")
Plug('maaslalani/nordbuddy')
vim.call("plug#end")

vim.cmd("colorscheme nordbuddy")
-- vim.cmd("colorscheme smyck")
