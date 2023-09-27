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

-- vim.g.mapleader = " "

require("lazy").setup({
	-- init.lua:
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                              , branch = '0.1.1',plug
		dependencies = {
      'nvim-lua/plenary.nvim'
    },
--     config = function()
--       require("telescope").setup {}
--     end,
	},
  {'ryanoasis/vim-devicons'},
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', lazy = true },
    },
    event = 'VeryLazy',
    config = function()
      -- Load treesitter grammar for org
      require('orgmode').setup_ts_grammar()

      -- Setup treesitter
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'org' },
        },
        ensure_installed = { 'org' },
      })

      -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      })
    end,
  },
  {'nvim-tree/nvim-web-devicons'},
  -- not working
  {'fcpg/vim-osc52'},
  -- trying this clipboard instead
  {'ojroques/vim-oscyank'},
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
  },
  { 'folke/tokyonight.nvim' },
  { 'rcarriga/nvim-notify' },
  {
    "amitds1997/remote-nvim.nvim",
    version = "*", -- This keeps it pinned to semantic releases
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      -- This would be an optional dependency eventually
      "nvim-telescope/telescope.nvim",
    },
    config = true, -- This calls the default setup(); make sure to call it
  },
  {
    'chipsenkbeil/distant.nvim', 
    branch = 'v0.3',
    config = function()
      require('distant'):setup()
    end
  },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'wincent/vim-clipper' },
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   version = "*",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("nvim-tree").setup {}
  --   end,
  -- },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    'moll/vim-bbye'
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    'goolord/alpha-nvim',
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    -- this herrington and maxmellon parts are so that tsx files will format correctly.
    -- https://www.reddit.com/r/neovim/comments/wrse9i/incorrect_indentation_on_jsxtsxreact_files/
    -- https://github.com/MaxMEllon/vim-jsx-pretty
    'HerringtonDarkholme/yats.vim'
  },
  {
    'maxmellon/vim-jsx-pretty'
  },
  {
    'sam4llis/nvim-lua-gf'
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "tpope/vim-rhubarb"
  },
  {
    {
      "aaronhallaert/advanced-git-search.nvim",
      config = function()
        require("telescope").load_extension("advanced_git_search")
      end,
      requires = {
        "nvim-telescope/telescope.nvim",
        -- to show diff splits and open commits in browser
        "tpope/vim-fugitive",
      },
    }
  },
  {
    "nvim-lua/plenary.nvim"
  },
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },
  -- {
  --   'RRethy/vim-illuminate'
  -- },
  {
    'MunifTanjim/nui.nvim'
  },
  {
    "glepnir/lspsaga.nvim", -- not sure what this does, is it a sidebar thing for outlining the file?
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        ui = {
          -- This option only works in Neovim 0.9
          title = true,
          -- Border type can be single, double, rounded, solid, shadow.
          border = "single",
          winblend = 0,
          expand = "",
          collapse = "",
          -- code_action = "💡",
          code_action = "",
          incoming = " ",
          outgoing = " ",
          hover = ' ',
          kind = {},
        },
      })
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    -- config = function()
    --   require('neo-tree').setup {
    --       enable_git_status = false,
    --   }
    -- end,
  },
  {
    's1n7ax/nvim-window-picker',
    -- tag = 'v1.*',
    config = function()
      require'window-picker'.setup()
    end,
  },
  {
    'kdheepak/lazygit.nvim'
  },
  {
    'xiyaowong/transparent.nvim'
  },
  {
    'ThePrimeagen/harpoon'
  },
  {
    'mbbill/undotree'
  },
  {
    "f-person/git-blame.nvim"
  },
  {
    "roxma/vim-tmux-clipboard"
  },
  {
    'christoomey/vim-tmux-navigator',
  },
  -- { 
  --   'dundalek/lazy-lsp.nvim', 
  --   requires = { 
  --     'neovim/nvim-lspconfig' 
  --   } 
  -- },
  -- {
  --   'VonHeikemen/lsp-zero.nvim',
  --   branch = 'v2.x',
  --   dependencies = {
  --     -- LSP Support
  --     {'neovim/nvim-lspconfig'},             -- Required
  --     {                                      -- Optional
  --       'williamboman/mason.nvim',
  --       build = function()
  --         pcall(vim.cmd, 'MasonUpdate')
  --       end,
  --     },
  --     {'williamboman/mason-lspconfig.nvim'}, -- Optional
  --
  --     -- Autocompletion
  --     {'hrsh7th/nvim-cmp'},     -- Required
  --     {'hrsh7th/cmp-nvim-lsp'}, -- Required
  --     {'L3MON4D3/LuaSnip'},     -- Required
  --   }
  -- },
  -- {
  --   "SirVer/ultisnips"
  -- },
  {
	  'VonHeikemen/lsp-zero.nvim',
	  -- branch = 'v1.x',
    branch = 'v2.x',
	  dependencies = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},                -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
		  -- {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},                 -- Required
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},             -- Required
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},                 --- Required
		  {'rafamadriz/friendly-snippets'},
	  }
  },
})
