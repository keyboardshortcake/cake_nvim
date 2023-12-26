return {
  {'ryanoasis/vim-devicons'},
  {'sbdchd/neoformat'},
  {'akinsho/org-bullets.nvim', config = true},
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
                    {'L2MON4D3/LuaSnip'},
  -- {
  --     "williamboman/mason.nvim",
  --     opts = function(_, opts)
  --       opts.ensure_installed = opts.ensure_installed or {}
  --       table.insert(opts.ensure_installed, "js-debug-adapter")
  --     end,
  --   },
  -- {
  --   'stevearc/oil.nvim',
  --   opts = {},
  --   -- Optional dependencies
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  -- },
  -- {
  --   'nvim-orgmode/orgmode',
  --   dependencies = {
  --     { 'nvim-treesitter/nvim-treesitter', lazy = true },
  --   },
  --   event = 'VeryLazy',
  --   config = function()
  --     -- Load treesitter grammar for org
  --     require('orgmode').setup_ts_grammar()
  --
  --     -- Setup treesitter
  --     require('nvim-treesitter.configs').setup({
  --       highlight = {
  --         enable = true,
  --         additional_vim_regex_highlighting = { 'org' },
  --       },
  --       ensure_installed = { 'org' },
  --     })
  --
  --     -- Setup orgmode
  --     require('orgmode').setup({
  --       org_agenda_files = '~/orgfiles/**/*',
  --       org_default_notes_file = '~/orgfiles/refile.org',
  --     })
  --   end,
  -- },
  {'nvim-tree/nvim-web-devicons'},
  -- not working
  -- {'fcpg/vim-osc52'},
  -- trying this clipboard instead
  -- {'ojroques/vim-oscyank'},
	-- {
	-- 	'nvim-treesitter/nvim-treesitter',
	-- 	run = ':TSUpdate'
 --  },
  -- { 'folke/tokyonight.nvim'},
  { 'rcarriga/nvim-notify' },
  -- {
  --   "amitds1997/remote-nvim.nvim",
  --   version = "*", -- This keeps it pinned to semantic releases
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --     -- This would be an optional dependency eventually
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   config = true, -- This calls the default setup(); make sure to call it
  -- },
  -- {
  --   'chipsenkbeil/distant.nvim', 
  --   branch = 'v0.3',
  --   config = function()
  --     require('distant'):setup()
  --   end
  -- },
  -- {
  --     'maksimr/vim-jsbeautify',
  -- },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'wincent/vim-clipper' },
  -- { 'mbbill/undotree' },
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
  -- {
  --   "folke/trouble.nvim",
  --   dependencies = "nvim-tree/nvim-web-devicons",
  --   config = function()
  --     require("trouble").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end
  -- },
  -- {
  --     'neoclide/coc.nvim'
  -- },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    'moll/vim-bbye'
  },
  -- {
  --   "ahmedkhalf/project.nvim",
  --   config = function()
  --     require("project_nvim").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end
  -- },
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = "v3.*",
  --   dependencies = 'nvim-tree/nvim-web-devicons'
  -- },
  -- {
  --   'goolord/alpha-nvim',
  --   config = function ()
  --     require'alpha'.setup(require'alpha.themes.dashboard'.config)
  --   end
  -- },
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
      "aaronhallaert/advanced-git-search.nvim",
      config = function()
        --require("telescope").load_extension("advanced_git_search")
      end,
	dependencies = {
		"nvim-telescope/telescope.nvim",
		-- to show diff splits and open commits in browser
		"tpope/vim-fugitive",
		-- to open commits in browser with fugitive
		"tpope/vim-rhubarb",
		-- optional: to replace the diff from fugitive with diffview.nvim
		-- (fugitive is still needed to open in browser)
		-- "sindrets/diffview.nvim",
	},
      -- requires = {
      --   "nvim-telescope/telescope.nvim",
      --   -- to show diff splits and open commits in browser
      --   "tpope/vim-fugitive",
      -- },
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
  -- {
  --   "glepnir/lspsaga.nvim", -- not sure what this does, is it a sidebar thing for outlining the file?
  --   event = "LspAttach",
  --   config = function()
  --     require("lspsaga").setup({
  --       ui = {
  --         -- This option only works in Neovim 0.9
  --         title = true,
  --         -- Border type can be single, double, rounded, solid, shadow.
  --         border = "single",
  --         winblend = 0,
  --         expand = "",
  --         collapse = "",
  --         -- code_action = "💡",
  --         code_action = "",
  --         incoming = " ",
  --         outgoing = " ",
  --         hover = ' ',
  --         kind = {},
  --       },
  --     })
  --   end,
  --   dependencies = {
  --     {"nvim-tree/nvim-web-devicons"},
  --     --Please make sure you install markdown and markdown_inline parser
  --     {"nvim-treesitter/nvim-treesitter"}
  --   }
  -- },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --     -- "3rd/image.nvim",
  --   },
  --   -- config = function()
  --   --   require('neo-tree').setup {
  --   --       enable_git_status = false,
  --   --   }
  --   -- end,
  -- },
  {
    's1n7ax/nvim-window-picker',
    -- tag = 'v1.*',
    config = function()
      require'window-picker'.setup()
    end,
  },
  {
      'neovim/nvim-lsp'
  },
  {
  "neovim/nvim-lspconfig",
    -- config = function()
    --     require("lspconfig").setup({
    --                 handlers = {
    --                     ["textDocument/definition"] = function(_, method, result)
    --                         if result == nil or vim.tbl_isempty(result) then
    --                             local _ = vim.lsp.log.info() and vim.lsp.log.info(method, 'No location found')
    --                             return nil
    --                         end
    --
    --
    --                         if vim.tbl_islist(result) then
    --                             vim.lsp.util.jump_to_location(result[1])
    --                             if #result > 1 then
    --                                 local isReactDTs = false
    --                                 for key, value in pairs(result) do
    --                                     if string.match(value.uri, "react/index.d.ts") then
    --                                         isReactDTs = true
    --                                         break
    --                                     end
    --                                 end
    --                                 if not isReactDTs then
    --                                     vim.lsp.util.set_qflist(util.locations_to_items(result))
    --                                     vim.api.nvim_command("copen")
    --                                     vim.api.api.nvim_command("wincmd p")
    --                                 end
    --                             end
    --                         else
    --                             vim.lsp.util.jump_to_location(result)
    --                         end
    --                     end
    --                 }
    --
    --     })
    -- end
--   lspconfig.tsserver.setup{
--   handlers = {
--     ["textDocument/definition"] = function(_, result, params)
--       if result == nil or vim.tbl_isempty(result) then
--         local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, 'No location found')
--         return nil
--       end
--
--       if vim.tbl_islist(result) then
--         vim.lsp.util.jump_to_location(result[1])
--         if #result > 1 then
--           local isReactDTs = false
--           for key, value in pairs(result) do
--             if string.match(value.uri, "react/index.d.ts") then
--               isReactDTs = true
--               break
--             end
--           end
--           if not isReactDTs then
--             vim.fn.setqflist(vim.lsp.util.locations_to_items(result))
--             vim.api.nvim_command("copen")
--           end
--         end
--       else
--         vim.lsp.util.jump_to_location(result)
--       end
--
--     end
--   };
-- }
  -- opts = {
  --   -- make sure mason installs the server
  --   servers = {
  --     tsserver = {
  --       keys = {
  --         {
  --           "<leader>co",
  --           function()
  --             vim.lsp.buf.code_action({
  --               apply = true,
  --               context = {
  --                 only = { "source.organizeImports.ts" },
  --                 diagnostics = {},
  --               },
  --             })
  --           end,
  --           desc = "Organize Imports",
  --         },
  --         {
  --           "<leader>cR",
  --           function()
  --             vim.lsp.buf.code_action({
  --               apply = true,
  --               context = {
  --                 only = { "source.removeUnused.ts" },
  --                 diagnostics = {},
  --               },
  --             })
  --           end,
  --           desc = "Remove Unused Imports",
  --         },
  --       },
  --       settings = {
  --         typescript = {
  --           format = {
  --             indentSize = vim.o.shiftwidth,
  --             convertTabsToSpaces = vim.o.expandtab,
  --             tabSize = vim.o.tabstop,
  --           },
  --         },
  --         javascript = {
  --           format = {
  --             indentSize = vim.o.shiftwidth,
  --             convertTabsToSpaces = vim.o.expandtab,
  --             tabSize = vim.o.tabstop,
  --           },
  --         },
  --         completions = {
  --           completeFunctionCalls = true,
  --         },
  --       },
  --     },
  --     eslint = {
  --       settings = {
  --         -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
  --         workingDirectory = { mode = "auto" },
  --       },
  --     },
  --
  --   },
  --   setup = {
  --     eslint = function()
  --       local function get_client(buf)
  --         return require("lazyvim.util").lsp.get_clients({ name = "eslint", bufnr = buf })[1]
  --       end
  --
  --       local formatter = require("lazyvim.util").lsp.formatter({
  --         name = "eslint: lsp",
  --         primary = false,
  --         priority = 200,
  --         filter = "eslint",
  --       })
  --
  --       -- Use EslintFixAll on Neovim < 0.10.0
  --       if not pcall(require, "vim.lsp._dynamic") then
  --         formatter.name = "eslint: EslintFixAll"
  --         formatter.sources = function(buf)
  --           local client = get_client(buf)
  --           return client and { "eslint" } or {}
  --         end
  --         formatter.format = function(buf)
  --           local client = get_client(buf)
  --           if client then
  --             local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
  --             if #diag > 0 then
  --               vim.cmd("EslintFixAll")
  --             end
  --           end
  --         end
  --       end
  --
  --       -- register the formatter with LazyVim
  --       require("lazyvim.util").format.register(formatter)
  --     end,
  --   },
  -- },
},
    -- {
    --     "pmizio/typescript-tools.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     config = function()
    --         local capabilities =
    --             require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    --             capabilities.textDocument.completion.completionItem.snippetSupport = true
    --
    --         require("typescript-tools").setup {
    --             on_attach = function(client, bufnr)
    --                 -- local opts = { buffer = bufnr }
    --                 vim.keymap.set("n", "<leader>fh", "<cmd>TSToolsOrganizeImports<cr>",
    --                     { buffer = bufnr, desc = "Organize Imports" })
    --                 vim.keymap.set("n", "<leader>lO", "<cmd>TSToolsSortImports<cr>",
    --                     { buffer = bufnr, desc = "Sort Imports" })
    --                 vim.keymap.set("n", "<leader>lu", "<cmd>TSToolsRemoveUnused<cr>",
    --                     { buffer = bufnr, desc = "Removed Unused" })
    --                 vim.keymap.set("n", "<leader>fd", "<cmd>TSToolsGoToSourceDefinition<cr>",
    --                     { buffer = bufnr, desc = "Go To Source Definition" })
    --                 vim.keymap.set("n", "<leader>lR", "<cmd>TSToolsRemoveUnusedImports<cr>",
    --                     { buffer = bufnr, desc = "Removed Unused Imports" })
    --                 vim.keymap.set("n", "<leader>lF", "<cmd>TSToolsFixAll<cr>", { buffer = bufnr, desc = "Fix All" })
    --                 vim.keymap.set("n", "<leader>lA", "<cmd>TSToolsAddMissingImports<cr>",
    --                     { buffer = bufnr, desc = "Add Missing Imports" })
    --             end,
    --             capabilities = capabilities,
    --             settings = {
    --                 expose_as_code_action = "all",
    --                 complete_function_calls = true,
    --             },
    --         }
    --     end,
    -- },
    -- Trying to get "go to source definition" action in nvim so i don't end up at type definition files lol
  -- require("cmp.lsp.utils").on_attach(function(client, bufnr)
    -- {
    --       "pmizio/typescript-tools.nvim",
    --       dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --       opts = {},
    --         config = function(_, opts)
    --             require("cmp_nvim_lsp").setup({
    --               on_attach = function(client, bufnr)
    --                   vim.keymap.set("n", "<leader>fh", ":TSToolsOrganizeImports<CR>", { buffer = bufnr, desc = "Organize Imports" })
    --               end
    --             })
    --         end,
    --         --   require("cmp_nvim_lsp").on_attach = function(client, bufnr)
    --         --     if client.name == "tsserver" then
    --         --       vim.keymap.set("n", "<leader>fk", ":TSToolsOrganizeImports<CR>", { buffer = bufnr, desc = "Organize Imports" })
    --         --       -- vim.keymap.set("n", "<leader>bO", ":TSToolsSortImports<CR>", { buffer = bufnr, desc = "Sort Imports" })
    --         --       -- vim.keymap.set("n", "<leader>bu", ":TSToolsRemoveUnused<CR>", { buffer = bufnr, desc = "Removed Unused" })
    --         --       -- vim.keymap.set("n", "<leader>bz", ":TSToolsGoToSourceDefinition<CR>", { buffer = bufnr, desc = "Go To Source Definition" })
    --         --       -- vim.keymap.set("n", "<leader>bR", ":TSToolsRemoveUnusedImports<CR>", { buffer = bufnr, desc = "Removed Unused Imports" })
    --         --       -- vim.keymap.set("n", "<leader>bF", ":TSToolsFixAll<CR>", { buffer = bufnr, desc = "Fix All" })
    --         --       -- vim.keymap.set("n", "<leader>bA", ":TSToolsAddMissingImports<CR>", { buffer = bufnr, desc = "Add Missing Imports" })
    --         --     end
    --         --   end
    --         --   -- require("typescript-tools").setup(opts)
    --         --   require("typescript-tools").setup({
    --         --
    --         --   })
    --         -- end,
    --     --   opts = {},
    --     -- config = function()
    --     --     local capabilities =
    --     --         require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    --     --     capabilities.textDocument.completion.completionItem.snippetSupport = true
    --     --
    --     --     require("typescript-tools").setup({
    --     --         on_attach = function(client, bufnr)
    --     --             local opts = { buffer = bufnr }
    --     --             local nnoremap = require("helper").nnoremap
    --     --
    --     --           vim.keymap.set("n", "<leader>lo", "<cmd>TSToolsOrganizeImports<cr>", { buffer = bufnr, desc = "Organize Imports" })
    --     --           vim.keymap.set("n", "<leader>lO", "<cmd>TSToolsSortImports<cr>", { buffer = bufnr, desc = "Sort Imports" })
    --     --           vim.keymap.set("n", "<leader>lu", "<cmd>TSToolsRemoveUnused<cr>", { buffer = bufnr, desc = "Removed Unused" })
    --     --           vim.keymap.set("n", "<leader>lz", "<cmd>TSToolsGoToSourceDefinition<cr>", { buffer = bufnr, desc = "Go To Source Definition" })
    --     --           vim.keymap.set("n", "<leader>lR", "<cmd>TSToolsRemoveUnusedImports<cr>", { buffer = bufnr, desc = "Removed Unused Imports" })
    --     --           vim.keymap.set("n", "<leader>lF", "<cmd>TSToolsFixAll<cr>", { buffer = bufnr, desc = "Fix All" })
    --     --           vim.keymap.set("n", "<leader>lA", "<cmd>TSToolsAddMissingImports<cr>", { buffer = bufnr, desc = "Add Missing Imports" })
    --     --             -- nnoremap("gld", "<CMD>TSToolsGoToSourceDefinition<CR>", opts)
    --     --             -- nnoremap("glf", "<CMD>TSToolsFixAll<CR>", opts)
    --     --             -- nnoremap("gli", "<CMD>TSToolsAddMissingImports<CR>", opts)
    --     --             -- nnoremap("glo", "<CMD>TSToolsOrganizeImports<CR>", opts)
    --     --
    --     --             on_attach(client, bufnr)
    --     --         end,
    --     --         capabilities = capabilities,
    --     --         settings = {
    --     --             expose_as_code_action = "all",
    --     --             complete_function_calls = true,
    --     --         },
    --     --     })
    --     -- end,
    -- },

  {
    'kdheepak/lazygit.nvim'
  },
  {
    'xiyaowong/transparent.nvim'
  },
  {
    'ThePrimeagen/harpoon'
  },
  -- {
  --   'mbbill/undotree'
  -- },
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
  -- {
	 --  'VonHeikemen/lsp-zero.nvim',
	 --  -- branch = 'v1.x',
  --   branch = 'v2.x',
	 --  dependencies = {
		--   -- LSP Support
		--   {'neovim/nvim-lspconfig'},                -- Required
  --     {                                      -- Optional
  --       'williamboman/mason.nvim',
  --       build = function()
  --         pcall(vim.cmd, 'MasonUpdate')
  --       end,
  --     },
		--   {'williamboman/mason.nvim'},
		--   {'williamboman/mason-lspconfig.nvim'},
  --
		--   -- Autocompletion
		--   {'hrsh7th/nvim-cmp'},                 -- Required
		--   {'hrsh7th/cmp-buffer'},
		--   {'hrsh7th/cmp-path'},
		--   {'saadparwaiz1/cmp_luasnip'},
		--   {'hrsh7th/cmp-nvim-lsp'},             -- Required
		--   {'hrsh7th/cmp-nvim-lua'},
  --
		--   -- Snippets
		--   {'L3MON4D3/LuaSnip'},                 --- Required
		--   {'rafamadriz/friendly-snippets'},
	 --  }
  -- },
}
