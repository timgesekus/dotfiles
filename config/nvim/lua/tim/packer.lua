local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- neoconf
  {
    'folke/neoconf.nvim',
    config = function()
      require("neoconf").setup({
      })
    end
  },
  { "elentok/format-on-save.nvim" },
  -- colorsheme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    --		config = function()
    --			require("rose-pine").setup()
    --			vim.cmd('colorscheme rose-pine')
    --		end
  },
  'Mofiqul/dracula.nvim',
  -- {'shaunsingh/solarized.nvim',
  --   config = function ()
  --    require("solarized").set()
  --   end},


  --
  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.2',
    dependencies = { { 'nvim-lua/plenary.nvim' },
      { 'BurntSushi/ripgrep' }
    }
  },


  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  'theprimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  -- Unison
  {
    "unisonweb/unison",
    branch = "trunk",
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/editor-support/vim")
      require("lazy.core.loader").packadd(plugin.dir .. "/editor-support/vim")
    end,
    init = function(plugin)
      require("lazy.core.loader").ftdetect(plugin.dir .. "/editor-support/vim")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
    },
  },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  },
  -- lsp
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  },
  {
    'weilbith/nvim-code-action-menu'
  },
  -- statusline
  {
    'nvim-lualine/lualine.nvim',
  },

  -- smart splits with tmux
  'mrjones2014/smart-splits.nvim',

  -- code actions
  {
    'kosayoda/nvim-lightbulb',
    dependencies = 'antoinemadec/FixCursorHold.nvim',
  },
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  },
  -- dap
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" }
  },

  -- java
  'mfussenegger/nvim-jdtls',

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        version = "v1.*"
      }
    }
  },

  -- comments
  {
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
  },
  'sindrets/diffview.nvim',
  -- Adds live server support
  'barrett-ruth/live-server.nvim',
  -- Adds support for closing brackets
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {
        fast_wrap = {},
      }
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- {
  --   'maxmx03/solarized.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.o.background = 'light' -- or 'light'
  --
  --     vim.cmd.colorscheme 'solarized'
  --   end,
  -- },
  -- toggle term
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      --[[ things you want to change go here]] }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
}
)
