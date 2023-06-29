vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- colorsheme
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
--		config = function()
--			require("rose-pine").setup()
--			vim.cmd('colorscheme rose-pine')
--		end
	})

  use 'shaunsingh/solarized.nvim'

  use 'shaunsingh/nord.nvim'

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

  -- comments
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  --- unison
  use {
    'unisonweb/unison',
    branch = "trunk",
    rtp = "editor-support/vim"
  }
  -- smart splits with tmux
  use('mrjones2014/smart-splits.nvim')

  -- code actions
  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
  }
  use({
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }) 
  -- dap
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- java
  use 'mfussenegger/nvim-jdtls'
  
use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        tag = "v1.*"
      }
    }
  }
end)
