return {
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({
	-- 			suggestion = {
	-- 				enabled = true,
	-- 				auto_trigger = false,
	-- 				auto_refresh = true,
	-- 				hide_during_completion = true,
	-- 				debounce = 75,
	-- 				trigger_on_accept = true,
	-- 				keymap = {
	-- 					accept = "<M-l>",
	-- 					accept_word = false,
	-- 					-- accept_line = false,
	-- 					accept_line = "<localleader>l",
	-- 					-- next = "<M-]>",
	-- 					-- next = "<C-]>",
	-- 					next = "<localleader>n",
	-- 					-- prev = "<M-[>",
	-- 					prev = "<localleader>p",
	-- 					-- dismiss = "<C-]>",
	-- 					dismiss = "<localleader>d",
	-- 				},
	-- 			},
	-- 			-- suggestion = { enabled = false },
	-- 			panel = { enabled = false },
	-- 			filetypes = {
	-- 				toggledo = false,
	-- 				["*"] = true,
	-- 				["markdown"] = false,
	-- 				-- ["toggledo"] = false,
	-- 				["*md"] = false,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },
	-- {
	-- 	"github/copilot.vim",
	-- },
	{
		"nfrid/markdown-togglecheck",
		dependencies = { "nfrid/treesitter-utils" },
		ft = { "markdown" },
	},
	-- {
	-- 	"ntpeters/vim-better-whitespace",
	-- },
	-- {
	-- 	"mistweaverco/kulala.nvim",
	-- 	keys = {
	-- 		{ "<leader>gs", desc = "Send request" },
	-- 		{ "<leader>gl", desc = "Send all requests" },
	-- 		{ "<leader>gb", desc = "Open scratchpad" },
	-- 	},
	-- 	ft = { "http", "rest" },
	-- 	opts = {
	-- 		-- your configuration comes here
	-- 		global_keymaps = false,
	-- 	},
	-- },
	{
		"mhinz/vim-signify",
		-- config = function()
	},
	{
		"vim-perl/vim-perl",
	},
	{ "EdenEast/nightfox.nvim" },
	-- { "junegunn/fzf", build = "./install --bin" },
	-- {
	-- 	"ibhagwan/fzf-lua",
	-- 	-- optional for icon support
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		-- calling `setup` is optional for customization
	-- 		require("fzf-lua").setup({})
	-- 	end,
	-- },
	{
		"davidmh/mdx.nvim",
		config = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},
	{ "LudoPinelli/comment-box.nvim" },
	{
		"danymat/neogen",
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
	{
		"nvim-treesitter/nvim-tree-docs",
	},
	{
		"heavenshell/vim-jsdoc",
	},
	{
		"kkoomen/vim-doge",
	},
	{
		"jsongerber/nvim-px-to-rem",
		config = true,
		--If you need to set some options replace the line above with:
		-- config = function()
		--     require('nvim-px-to-rem').setup()
		-- end,
	},
	{
		"kkoomen/vim-doge",
	},
	{
		"stevearc/conform.nvim",
		-- optional = true,
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				["javascript"] = { "prettier" },
				["javascriptreact"] = { "prettier" },
				["typescript"] = { "prettier" },
				["typescriptreact"] = { "prettier" },
				["vue"] = { "prettier" },
				["css"] = { "prettier" },
				["scss"] = { "prettier" },
				["less"] = { "prettier" },
				["html"] = { "prettier" },
				["json"] = { "prettier" },
				["jsonc"] = { "prettier" },
				["yaml"] = { "prettier" },
				["markdown"] = { "prettier" },
				["markdown.mdx"] = { "prettier" },
				["graphql"] = { "prettier" },
				["handlebars"] = { "prettier" },
				["_"] = { "trim_whitespace" },
			},
		},
		config = function()
			require("conform").setup({
				format_on_save = {
					-- -- These options will be passed to conform.format()
					-- timeout_ms = 500,
					-- -- lsp_fallback = true,
					-- lsp_format = "fallback"
				},
			})
		end,
	},
	-- {
	-- 	"esmuellert/nvim-eslint",
	-- 	config = function()
	-- 		require("nvim-eslint").setup({
	-- 			-- Toggle debug mode for ESLint language server, see debugging part
	-- 			-- debug = false,
	--
	-- 			-- Command to launch language server. You might hardly want to change this setting
	-- 			-- cmd = M.create_cmd(),
	--
	-- 			-- root_dir is used by Neovim LSP client API to determine if to attach or launch new LSP
	-- 			-- The default configuration uses the git root folder as the root_dir
	-- 			-- For monorepo it can have many projects, so launching too many LSP for one workspace is not efficient
	-- 			-- You can override it with passing function(bufnr)
	-- 			-- It should receive active buffer number and return root_dir
	-- 			-- root_dir = M.resolve_git_dir(args.buf),
	--
	-- 			-- A table used to determine what filetypes trigger the start of LSP
	-- 			-- filetypes = {
	-- 			-- 	"javascript",
	-- 			-- 	"javascriptreact",
	-- 			-- 	"javascript.jsx",
	-- 			-- 	"typescript",
	-- 			-- 	"typescriptreact",
	-- 			-- 	"typescript.tsx",
	-- 			-- 	"vue",
	-- 			-- 	"svelte",
	-- 			-- 	"astro",
	-- 			-- },
	--
	-- 			-- The client capabilities for LSP Protocol. See Nvim LSP docs for details
	-- 			-- It uses the default Nvim LSP client capabilities. Adding the capability to dynamically change configs
	-- 			-- capabilities = M.make_client_capabilities(),
	--
	-- 			handlers = {
	-- 				-- The handlers handles language server responses. See Nvim LSP docs for details
	-- 				-- The default handlers only has a rewrite of default "workspace/configuration" handler of Nvim LSP
	-- 				-- Basically, when you load a new buffer, ESLint LSP requests the settings with this request
	-- 				-- To make it work with monorepo, the workingDirectory setting needs to be calculated at runtime
	-- 				-- This is the main reaason for rewriting, and it also works if you have a simple structure repo
	-- 				-- You might add more custom handler with reference to LSP protocol spec and vscode-eslint code
	-- 			},
	--
	-- 			-- The settings send to ESLint LSP. See below part for details.
	-- 			settings = {
	-- 				-- validate = "on",
	-- 				-- -- packageManager = 'pnpm',
	-- 				-- useESLintClass = true,
	-- 				-- useFlatConfig = function(bufnr)
	-- 				-- 	return M.use_flat_config(bufnr)
	-- 				-- end,
	-- 				-- experimental = { useFlatConfig = false },
	-- 				-- codeAction = {
	-- 				-- 	disableRuleComment = {
	-- 				-- 		enable = true,
	-- 				-- 		location = "separateLine",
	-- 				-- 	},
	-- 				-- 	showDocumentation = {
	-- 				-- 		enable = true,
	-- 				-- 	},
	-- 				-- },
	-- 				-- codeActionOnSave = { mode = "all" },
	-- 				-- format = false,
	-- 				-- quiet = false,
	-- 				-- onIgnoredFiles = "off",
	-- 				-- options = {},
	-- 				rulesCustomizations = {
	-- 					{ rule = "no-debugger" },
	-- 					{ rule = "no-console" },
	-- 					-- { rule = "no-unused-vars", severity = "warn", fixable = true },
	-- 					-- { rule = "no-undef", severity = "warn", fixable = true },
	-- 					-- { rule = "no-extra-semi", severity = "warn", fixable = true },
	-- 					-- { rule = "quotes", severity = "warn", fixable = true },
	-- 					-- { rule = "semi", severity = "warn", fixable = true },
	-- 					-- { rule = "indent", severity = "warn", fixable = true },
	-- 					-- { rule = "space-in-parens", severity = "warn", fixable = true },
	-- 					-- { rule = "space-infix-ops", severity = "warn", fixable = true },
	-- 					-- { rule = "space-unary-ops", severity = "warn", fixable = true },
	-- 					-- { rule = "space-before-function-paren", severity = "warn", fixable = true },
	-- 					-- { rule = "style/*", severity = "off", fixable = true },
	-- 					-- { rule = "format/*", severity = "off", fixable = true },
	-- 					-- { rule = "*-indent", severity = "off", fixable = true },
	-- 					-- { rule = "*-spacing", severity = "off", fixable = true },
	-- 					-- { rule = "*-spaces", severity = "off", fixable = true },
	-- 					-- { rule = "*-order", severity = "off", fixable = true },
	-- 					-- { rule = "*-dangle", severity = "off", fixable = true },
	-- 					-- { rule = "*-nehline", severity = "off", fixable = true },
	-- 					-- { rule = "*quotes", severity = "off", fixable = true },
	-- 					-- { rule = "*semi", severity = "off", fixable = true },
	-- 					--                             "react-hooks/exhaustive-deps": "off",
	-- 					--                             -- "no-console": "off",
	-- 					--                             -- "no-debugger": "off",
	-- 					--                         },"
	-- 					--
	-- 					-- -- 			"no-unused-vars": "warn",
	-- 					--                         -- "no-debugger":"off"
	-- 					--                              -- "react-hooks/exhaustive-deps": "off",
	-- 					--                              -- "no-console": "off",
	-- 					--                              -- "no-debugger":"off",
	-- 				},
	-- 				-- run = "onType",
	-- 				-- problems = { shortenToSingleLine = false },
	-- 				-- nodePath = function(bufnr)
	-- 				-- 	return M.resolve_node_path()
	-- 				-- end,
	-- 				-- workingDirectory = { mode = "location" },
	-- 				-- workspaceFolder = function(bufnr)
	-- 				-- 	local git_dir = M.resolve_git_dir(bufnr)
	-- 				-- 	return {
	-- 				-- 		uri = vim.uri_from_fname(git_dir),
	-- 				-- 		name = vim.fn.fnamemodify(git_dir, ":t"),
	-- 				-- 	}
	-- 				-- end,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	--     "Asheq/close-buffers.vim",
	-- },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	-- {
	--     "nvim-tree/nvim-tree.lua",
	--     dependencies = {
	--
	--     },
	--     opts = function()
	--     end,
	--     config = function()
	--         require("nvim-tree").setup()
	--     end
	-- },
	-- {
	--     "lambdalisue/fern.vim",
	--     dependencies = {
	--         "lambdalisue/fern-renderer-nerdfont.vim",
	--         "andreafrancia/trash-cli",
	--         "yuki-yano/fern-preview.vim",
	--     }
	-- },
	-- {
	--     "luukvbaal/nnn.nvim",
	--     config = function()
	--         require('nnn').setup()
	--     end
	-- },
	-- {
	{ "atelierbram/Base4Tone-nvim" }, -- colorscheme
	-- },
	-- {
	--     "dzfrias/noir.nvim",
	-- },
	{
		"NLKNguyen/papercolor-theme",
	},
	-- {
	--     "no-clown-fiesta/no-clown-fiesta.nvim",
	-- },
	-- { 'ryanoasis/vim-devicons' },
	{ "sbdchd/neoformat" },
	-- {
	--     'tpope/vim-repeat',
	-- },
	-- {
	--     'vim-pandoc/vim-pandoc-syntax',
	--     -- config = function()
	--         -- require("pandoc-syntax").setup({})
	--     -- end
	-- },
	-- {
	--     "preservim/vim-markdown",
	-- },
	{
		"mattn/calendar-vim",
		-- config = function()
		--     require('calendar-vim').setup()
		-- end
	},
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true, -- or `opts = {}`
	},
	-- {
	-- 	"lalitmee/browse.nvim",
	-- 	-- dependencies = { "nvim-telescope/telescope.nvim" },
	-- 	config = function()
	-- 		require("browse").setup({
	-- 			-- default values for the setup
	-- 			require("browse").setup({
	-- 				-- search provider you want to use
	-- 				provider = "google", -- duckduckgo, bing
	--
	-- 				-- either pass it here or just pass the table to the functions
	-- 				-- see below for more
	-- 				bookmarks = {},
	-- 				icons = {
	-- 					bookmark_alias = "", -- if you have nerd fonts, you can set this to ""
	-- 					bookmarks_prompt = "󰂺 ", -- if you have nerd fonts, you can set this to "󰂺 "
	-- 					grouped_bookmarks = "", -- if you have nerd fonts, you can set this to 
	-- 				},
	-- 			}),
	-- 		})
	-- 	end,
	-- },
	{
		-- couldn't get this to work :-/ meh
		-- have to install this command line tool for this to do anything I think?
		-- https://github.com/chrisdickinson/mdn-cli
		"mklabs/mdn.vim",
		config = function()
			-- require('mdn.vim').setup()
		end,
	},
	{
		"neovim/node-host",
	},
	{
		"gsuuon/note.nvim",
		opts = {
			-- Spaces are note roots. These directories should contain a `./notes` directory (will be made if not).
			-- Defaults to { '~' }.
			spaces = {
				"~",
				-- '~/projects/foo'
			},

			-- Set keymap = false to disable keymapping
			-- keymap = {
			--   prefix = '<leader>n'
			-- }
		},
		cmd = "Note",
		ft = "note",
	},
	{
		"metakirby5/codi.vim",
	},
	-- { -- actually have no idea what this does
	--     "lukas-reineke/virt-column.nvim",
	--     config = function()
	--         require("virt-column").setup({})
	--     end
	-- },
	-- {
	--     'FraserLee/ScratchPad',
	--     config = function()
	--         require('virt-column').setup {
	--             char = '|',
	--         }
	--         vim.g.scratchpad_autostart = 0
	--         vim.g.scratchpad_autofocus = 1
	--         -- vim.api.nvim_set_hl(0, "Scratchpad", { ctermfg=White })
	--         -- vim.api.nvim_set_hl(0, "Scratchpad", { ctermfg="Red", ctermbg="Blue" })
	--         -- vim.api.nvim_set_hl(0, "Scratchpad", { ctermfg=10, ctermbg=0, guifg=Green, guibg=Black })
	--         vim.api.nvim_set_hl(0, "Scratchpad", { ctermfg = 10 })
	--         -- vim.cmd.hi("Scratchpad", "ctermfg=red", "ctermbg=black", "guifg=blue");
	--         -- require('scratchpad').setup({})
	--     end
	-- },
	-- {
	--     -- oldie but goodie. very sweet, just <leader>tt to add/toggle checkbox on a line
	--     "jkramer/vim-checkbox",
	-- },
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
			})
		end,
	},
	-- {
	-- 	"HiPhish/rainbow-delimiters.nvim",
	-- 	config = function()
	-- 		local rainbow_delimiters = require("rainbow-delimiters")
	--
	-- 		require("rainbow-delimiters.setup").setup({
	-- 			strategy = {
	-- 				[""] = rainbow_delimiters.strategy["global"],
	-- 				vim = rainbow_delimiters.strategy["local"],
	-- 			},
	-- 			query = {
	-- 				[""] = "rainbow-delimiters",
	-- 				lua = "rainbow-blocks",
	-- 			},
	-- 			priority = {
	-- 				[""] = 110,
	-- 				lua = 210,
	-- 			},
	-- 			highlight = {
	-- 				"RainbowDelimiterRed",
	-- 				"RainbowDelimiterYellow",
	-- 				"RainbowDelimiterBlue",
	-- 				"RainbowDelimiterOrange",
	-- 				"RainbowDelimiterGreen",
	-- 				"RainbowDelimiterViolet",
	-- 				"RainbowDelimiterCyan",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- { "wfxr/minimap.vim" },
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {
			modes = {
				char = {
					keys = { "f", "F", "t", "T" }, -- excluding ; and , symbols
				},
			},
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	-- {
	-- 	-- pretty good:
	-- 	-- 'justinmk/vim-sneak',
	-- 	-- this port seems like it does more:
	-- 	"ggandor/leap.nvim",
	-- 	config = function()
	-- 		-- require('leap').create_default_mappings("true")
	-- 		-- require('leap').add_repeat_mappings(';', ',', {
	-- 		--     -- False by default. If set to true, the keys will work like the
	-- 		--     -- native semicolon/comma, i.e., forward/backward is understood in
	-- 		--     -- relation to the last motion.
	-- 		--     relative_directions = true,
	-- 		--     -- By default, all modes are included.
	-- 		--     modes = { 'n', 'x', 'o' },
	-- 		-- })
	-- 	end,
	-- },
	{
		"szw/vim-maximizer",
	},
	{
		"MattesGroeger/vim-bookmarks",
		-- config = function()
		--     require("bookmarks").setup({
		--         bookmark_auto_close = 1,
		--     })
		-- end
	},
	-- {
	--     "Shougo/unite.vim",
	-- },
	-- {
	--     "rest-nvim/rest.nvim",
	--     config = function()
	--         require("rest-nvim").setup({
	--             -- Open request results in a horizontal split
	--             result_split_horizontal = false,
	--             -- Keep the http file buffer above|left when split horizontal|vertical
	--             result_split_in_place = false,
	--             -- stay in current windows (.http file) or change to results window (default)
	--             stay_in_current_window_after_split = false,
	--             -- Skip SSL verification, useful for unknown certificates
	--             skip_ssl_verification = false,
	--             -- Encode URL before making request
	--             encode_url = true,
	--             -- Highlight request on run
	--             highlight = {
	--                 enabled = true,
	--                 timeout = 150,
	--             },
	--             result = {
	--                 -- toggle showing URL, HTTP info, headers at top the of result window
	--                 show_url = true,
	--                 -- show the generated curl command in case you want to launch
	--                 -- the same request via the terminal (can be verbose)
	--                 show_curl_command = false,
	--                 show_http_info = true,
	--                 show_headers = true,
	--                 -- table of curl `--write-out` variables or false if disabled
	--                 -- for more granular control see Statistics Spec
	--                 show_statistics = false,
	--                 -- executables or functions for formatting response body [optional]
	--                 -- set them to false if you want to disable them
	--                 formatters = {
	--                     json = "jq",
	--                     html = function(body)
	--                         return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
	--                     end
	--                 },
	--             },
	--             -- Jump to request line on run
	--             jump_to_request = false,
	--             env_file = '.env',
	--             custom_dynamic_variables = {},
	--             yank_dry_run = true,
	--             search_back = true,
	--
	--         })
	--     end
	-- },
	-- {
	-- 	"dkarter/bullets.vim",
	-- },
	{ "bullets-vim/bullets.vim" },
	-- {
	--
	-- },
	-- {
	--     'vuciv/vim-bujo',
	--     config = function()
	--         -- require('vim-bujo').setup()
	--     end
	-- },
	-- {
	--     "RutaTang/quicknote.nvim",
	--     config = function()
	--         require("quicknote").setup({
	--             mode = "resident", -- "portable" | "resident", default to "portable"
	--             sign = "N",        -- This is used for the signs on the left side (refer to ShowNoteSigns() api).
	--             -- You can change it to whatever you want (eg. some nerd fonts icon), 'N' is default
	--             filetype = "md",
	--             -- git_branch_recognizable = true, -- If true, quicknote will separate notes by git branch
	--             -- But it should only be used with resident mode,  it has not effect used with portable mode
	--         })
	--     end,
	--     dependencies = { "nvim-lua/plenary.nvim" },
	-- },
	-- {                          -- maybe this should be a dependency of nvim-ufo cuz ... i need them folds to stay lol
	--     "chrisgrieser/nvim-origami",
	--     event = "BufReadPost", -- later or on keypress would prevent saving folds
	--     opts = true,           -- needed even when using default config
	-- },
	-- {
	--     'kevinhwang91/nvim-ufo',
	--     dependencies = {
	--         'kevinhwang91/promise-async',
	--         {
	--             "luukvbaal/statuscol.nvim",
	--             config = function()
	--               local builtin = require("statuscol.builtin")
	--               require("statuscol").setup({
	--                 relculright = true,
	--                 segments = {
	--                   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
	--                   { text = { "%s" }, click = "v:lua.ScSa" },
	--                   { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
	--                 },
	--               })
	--             end,
	--         },
	--     },
	--     -- event = "BufReadPost",
	--     config = function()
	--         -- local handler = function(virtText, lnum, endLnum, width, truncate)
	--         --     local newVirtText = {}
	--         --     local suffix = (' 󰁂 %d '):format(endLnum - lnum)
	--         --     local sufWidth = vim.fn.strdisplaywidth(suffix)
	--         --     local targetWidth = width - sufWidth
	--         --     local curWidth = 0
	--         --     for _, chunk in ipairs(virtText) do
	--         --         local chunkText = chunk[1]
	--         --         local chunkWidth = vim.fn.strdisplaywidth(chunkText)
	--         --         if targetWidth > curWidth + chunkWidth then
	--         --             table.insert(newVirtText, chunk)
	--         --         else
	--         --             chunkText = truncate(chunkText, targetWidth - curWidth)
	--         --             local hlGroup = chunk[2]
	--         --             table.insert(newVirtText, { chunkText, hlGroup })
	--         --             chunkWidth = vim.fn.strdisplaywidth(chunkText)
	--         --             -- str width returned from truncate() may less than 2nd argument, need padding
	--         --             if curWidth + chunkWidth < targetWidth then
	--         --                 suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
	--         --             end
	--         --             break
	--         --         end
	--         --         curWidth = curWidth + chunkWidth
	--         --     end
	--         --     table.insert(newVirtText, { suffix, 'MoreMsg' })
	--         --     return newVirtText
	--         -- end
	--         require('ufo').setup({
	--             -- open_fold_hl_timeout = 150,
	--             open_fold_hl_timeout = 400,
	--             -- close_fold_kinds = { 'imports', 'comment' }, -- deprecated
	--             close_fold_kinds_for_ft = { 'imports', 'comment' }, -- deprecated
	--
	--             preview = {
	--                 win_config = {
	--                     border = { '', '─', '', '', '', '─', '', '' },
	--                     winhighlight = 'Normal:Folded',
	--                     winblend = 0
	--                 },
	--                 mappings = {
	--                     scrollU = '<C-u>',
	--                     scrollD = '<C-d>',
	--                     jumpTop = '[',
	--                     jumpBot = ']'
	--                 }
	--             },
	--             provider_selector = function(bufnr, filetype, buftype)
	--                 -- if you prefer treesitter provider rather than lsp,
	--                 -- return ftMap[filetype] or {'treesitter', 'indent'}
	--                 -- return ftMap[filetype]
	--                 return { 'treesitter', 'indent' }
	--
	--                 -- refer to ./doc/example.lua for detail
	--             end,
	--             -- fold_virt_text_handler = handler,
	--         })
	--
	--         vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
	--         vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
	--         vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
	--         vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
	--         vim.keymap.set('n', 'K', function()
	--             local winid = require('ufo').peekFoldedLinesUnderCursor()
	--             if not winid then
	--                 -- choose one of coc.nvim and nvim lsp
	--                 vim.fn.CocActionAsync('definitionHover') -- coc.nvim
	--                 vim.lsp.buf.hover()
	--             end
	--         end)
	--     end
	-- },
	{
		"toppair/reach.nvim",
		config = function()
			require("reach").setup({
				notifications = true,
			})
		end,
	},
	{
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- {
	--     'mhartington/formatter.nvim',
	-- },
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	},
	{
		"sindrets/diffview.nvim",
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
	{
		"farmergreg/vim-lastplace",
	},
	-- installing this actually to get rid of the red bars like here
	-- https://github.com/neovim/neovim/issues/14720
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		-- tag = "v2.20.8",
		commit = "29be0919b91fb59eca9e90690d76014233392bef",
		-- opts = {},
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}
			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			vim.g.rainbow_delimiters = { highlight = highlight }
			require("ibl").setup({ scope = { highlight = highlight } })

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
	-- { 'akinsho/org-bullets.nvim',                 config = true },
	-- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	-- { 'L2MON4D3/LuaSnip' },
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
	-- {'nvim-tree/nvim-web-devicons'},
	-- not working
	-- {'fcpg/vim-osc52'},
	-- trying this clipboard instead
	-- {'ojroques/vim-oscyank'},
	-- {
	-- 	'nvim-treesitter/nvim-treesitter',
	-- 	run = ':TSUpdate'
	--  },
	{ "folke/tokyonight.nvim" },
	{ "rcarriga/nvim-notify" },
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
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "wincent/vim-clipper" },
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
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	-- {
	--     "folke/which-key.nvim",
	--     config = function()
	--         vim.o.timeout = true
	--         vim.o.timeoutlen = 300
	--         require("which-key").setup({
	--             -- your configuration comes here
	--             -- or leave it empty to use the default settings
	--             -- refer to the configuration section below
	--         })
	--     end,
	-- },
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
		"numToStr/Comment.nvim",
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				event = "BufRead",
			},
		},
		config = function()
			require("Comment").setup({
				---Add a space b/w comment and the line
				padding = true,
				---Whether the cursor should stay at its position
				sticky = true,
				---Lines to be ignored while (un)comment ignore = nil,
				---LHS of toggle mappings in NORMAL mode
				toggler = {
					---Line-comment toggle keymap
					line = "gcc",
					---Block-comment toggle keymap
					block = "gbc",
				},
				---LHS of operator-pending mappings in NORMAL and VISUAL mode
				opleader = {
					---Line-comment keymap
					line = "gc",
					---Block-comment keymap
					block = "gb",
				},
				---LHS of extra mappings
				extra = {
					---Add comment on the line above
					above = "gcO",
					---Add comment on the line below
					below = "gco",
					---Add comment at the end of line
					eol = "gcA",
				},
				---Enable keybindings
				---NOTE: If given `false` then the plugin won't create any mappings
				mappings = {
					---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
					basic = false,
					---Extra mapping; `gco`, `gcO`, `gcA`
					extra = false,
				},
				---Function to call before (un)comment
				pre_hook = nil,
				---Function to call after (un)comment
				post_hook = nil,
			})
		end,
	},
	{
		"moll/vim-bbye",
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
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		-- this herrington and maxmellon parts are so that tsx files will format correctly.
		-- https://www.reddit.com/r/neovim/comments/wrse9i/incorrect_indentation_on_jsxtsxreact_files/
		-- https://github.com/MaxMEllon/vim-jsx-pretty
		"HerringtonDarkholme/yats.vim",
	},
	{
		"maxmellon/vim-jsx-pretty",
	},
	{
		"sam4llis/nvim-lua-gf",
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"tpope/vim-rhubarb",
	},
	-- {
	--     "aaronhallaert/advanced-git-search.nvim",
	--     config = function()
	--         --require("telescope").load_extension("advanced_git_search")
	--     end,
	--     dependencies = {
	--         "nvim-telescope/telescope.nvim",
	--         -- to show diff splits and open commits in browser
	--         "tpope/vim-fugitive",
	--         -- to open commits in browser with fugitive
	--         "tpope/vim-rhubarb",
	--         -- optional: to replace the diff from fugitive with diffview.nvim
	--         -- (fugitive is still needed to open in browser)
	--         -- "sindrets/diffview.nvim",
	--     },
	--     -- requires = {
	--     --   "nvim-telescope/telescope.nvim",
	--     --   -- to show diff splits and open commits in browser
	--     --   "tpope/vim-fugitive",
	--     -- },
	-- },
	-- {
	--     "nvim-lua/plenary.nvim"
	-- },
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	-- {
	--   'RRethy/vim-illuminate'
	-- },
	-- {
	--     'MunifTanjim/nui.nvim'
	-- },
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
	-- {
	--   's1n7ax/nvim-window-picker',
	--   -- tag = 'v1.*',
	--   config = function()
	--     require'window-picker'.setup()
	--   end,
	-- },
	-- {
	--     'neovim/nvim-lsp'
	-- },
	-- {
	--     "neovim/nvim-lspconfig",
	--     -- config = function()
	--     --     require("lspconfig").setup({
	--     --                 handlers = {
	--     --                     ["textDocument/definition"] = function(_, method, result)
	--     --                         if result == nil or vim.tbl_isempty(result) then
	--     --                             local _ = vim.lsp.log.info() and vim.lsp.log.info(method, 'No location found')
	--     --                             return nil
	--     --                         end
	--     --
	--     --
	--     --                         if vim.tbl_islist(result) then
	--     --                             vim.lsp.util.jump_to_location(result[1])
	--     --                             if #result > 1 then
	--     --                                 local isReactDTs = false
	--     --                                 for key, value in pairs(result) do
	--     --                                     if string.match(value.uri, "react/index.d.ts") then
	--     --                                         isReactDTs = true
	--     --                                         break
	--     --                                     end
	--     --                                 end
	--     --                                 if not isReactDTs then
	--     --                                     vim.lsp.util.set_qflist(util.locations_to_items(result))
	--     --                                     vim.api.nvim_command("copen")
	--     --                                     vim.api.api.nvim_command("wincmd p")
	--     --                                 end
	--     --                             end
	--     --                         else
	--     --                             vim.lsp.util.jump_to_location(result)
	--     --                         end
	--     --                     end
	--     --                 }
	--     --
	--     --     })
	--     -- end
	--     --   lspconfig.tsserver.setup{
	--     --   handlers = {
	--     --     ["textDocument/definition"] = function(_, result, params)
	--     --       if result == nil or vim.tbl_isempty(result) then
	--     --         local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, 'No location found')
	--     --         return nil
	--     --       end
	--     --
	--     --       if vim.tbl_islist(result) then
	--     --         vim.lsp.util.jump_to_location(result[1])
	--     --         if #result > 1 then
	--     --           local isReactDTs = false
	--     --           for key, value in pairs(result) do
	--     --             if string.match(value.uri, "react/index.d.ts") then
	--     --               isReactDTs = true
	--     --               break
	--     --             end
	--     --           end
	--     --           if not isReactDTs then
	--     --             vim.fn.setqflist(vim.lsp.util.locations_to_items(result))
	--     --             vim.api.nvim_command("copen")
	--     --           end
	--     --         end
	--     --       else
	--     --         vim.lsp.util.jump_to_location(result)
	--     --       end
	--     --
	--     --     end
	--     --   };
	--     -- }
	--     -- opts = {
	--     --   -- make sure mason installs the server
	--     --   servers = {
	--     --     tsserver = {
	--     --       keys = {
	--     --         {
	--     --           "<leader>co",
	--     --           function()
	--     --             vim.lsp.buf.code_action({
	--     --               apply = true,
	--     --               context = {
	--     --                 only = { "source.organizeImports.ts" },
	--     --                 diagnostics = {},
	--     --               },
	--     --             })
	--     --           end,
	--     --           desc = "Organize Imports",
	--     --         },
	--     --         {
	--     --           "<leader>cR",
	--     --           function()
	--     --             vim.lsp.buf.code_action({
	--     --               apply = true,
	--     --               context = {
	--     --                 only = { "source.removeUnused.ts" },
	--     --                 diagnostics = {},
	--     --               },
	--     --             })
	--     --           end,
	--     --           desc = "Remove Unused Imports",
	--     --         },
	--     --       },
	--     --       settings = {
	--     --         typescript = {
	--     --           format = {
	--     --             indentSize = vim.o.shiftwidth,
	--     --             convertTabsToSpaces = vim.o.expandtab,
	--     --             tabSize = vim.o.tabstop,
	--     --           },
	--     --         },
	--     --         javascript = {
	--     --           format = {
	--     --             indentSize = vim.o.shiftwidth,
	--     --             convertTabsToSpaces = vim.o.expandtab,
	--     --             tabSize = vim.o.tabstop,
	--     --           },
	--     --         },
	--     --         completions = {
	--     --           completeFunctionCalls = true,
	--     --         },
	--     --       },
	--     --     },
	--     --     eslint = {
	--     --       settings = {
	--     --         -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
	--     --         workingDirectory = { mode = "auto" },
	--     --       },
	--     --     },
	--     --
	--     --   },
	--     --   setup = {
	--     --     eslint = function()
	--     --       local function get_client(buf)
	--     --         return require("lazyvim.util").lsp.get_clients({ name = "eslint", bufnr = buf })[1]
	--     --       end
	--     --
	--     --       local formatter = require("lazyvim.util").lsp.formatter({
	--     --         name = "eslint: lsp",
	--     --         primary = false,
	--     --         priority = 200,
	--     --         filter = "eslint",
	--     --       })
	--     --
	--     --       -- Use EslintFixAll on Neovim < 0.10.0
	--     --       if not pcall(require, "vim.lsp._dynamic") then
	--     --         formatter.name = "eslint: EslintFixAll"
	--     --         formatter.sources = function(buf)
	--     --           local client = get_client(buf)
	--     --           return client and { "eslint" } or {}
	--     --         end
	--     --         formatter.format = function(buf)
	--     --           local client = get_client(buf)
	--     --           if client then
	--     --             local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
	--     --             if #diag > 0 then
	--     --               vim.cmd("EslintFixAll")
	--     --             end
	--     --           end
	--     --         end
	--     --       end
	--     --
	--     --       -- register the formatter with LazyVim
	--     --       require("lazyvim.util").format.register(formatter)
	--     --     end,
	--     --   },
	--     -- },
	-- },
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
		"kdheepak/lazygit.nvim",
	},
	{
		"xiyaowong/transparent.nvim",
	},
	{
		"ThePrimeagen/harpoon",
	},
	{
		"tmux-plugins/vim-tmux-focus-events",
	},
	-- {
	--   'mbbill/undotree'
	-- },
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({
				enabled = false,
			})
		end,
	},
	{
		"roxma/vim-tmux-clipboard",
	},
	-- {
	--   'christoomey/vim-tmux-navigator',
	-- },
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
