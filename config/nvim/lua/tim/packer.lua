vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { { 'nvim-lua/plenary.nvim' },
      { 'BurntSushi/ripgrep' }
    }
  }


  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
    "unisonweb/unison",
    branch = "trunk",
    rtp = "/editor-support/vim"
  }
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
    },
  })
use({
    "scalameta/nvim-metals",
    requires = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  })
  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
                               -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' }, -- Required
    }
  }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
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
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  -- java
  use 'mfussenegger/nvim-jdtls'

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        tag = "v1.*"
      }
    }
  }
  -- comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup(
        {
          padding = true,
          sticky = true,
          ignore = nil,
          toggler = { line = 'gcc', block = 'gbc' },
          opleader = { line = 'gc', block = 'gb' },
          extra = { above = 'gcO', below = 'gco', eol = 'gcA' },
          mappings = { basic = true, extra = true },
          pre_hook = nil,
          post_hook = nil,
        }
      )
    end
  }
  use {'sindrets/diffview.nvim'}
end)
