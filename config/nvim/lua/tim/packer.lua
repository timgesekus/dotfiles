vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- colorsheme
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			require("rose-pine").setup()
			vim.cmd('colorscheme rose-pine')
		end
	})
	--
	-- telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}               


	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use ('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
	-- lsp
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{ "hrsh7th/cmp-vsnip" }, 
			{ "hrsh7th/vim-vsnip" },
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}

	-- metals
	use( {
		'scalameta/nvim-metals', 
		requires = { 
			"nvim-lua/plenary.nvim" ,
			"mfussenegger/nvim-dap"
	}})	
  
  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "unisonweb/unison",
    branch = "trunk",
    rtp = "/editor-support/vim"
  }
end)
