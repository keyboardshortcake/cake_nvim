-- return {
--   "neovim/nvim-lspconfig",
-- }
-- return {
-- 	"neovim/nvim-lspconfig",
-- 	opts = {
-- 		servers = {
-- 			copilot = {
--         -- stylua: ignore
--         keys = {
--           {
--             -- "<M-]>",
--             "<localleader>n",
--             function() vim.lsp.inline_completion.select({ count = 1 }) end,
--             desc = "Next Copilot Suggestion",
--             mode = { "i", "n" },
--           },
--           {
--             -- "<M-[>",
--             "<localleader>p",
--             function() vim.lsp.inline_completion.select({ count = -1 }) end,
--             desc = "Prev Copilot Suggestion",
--             mode = { "i", "n" },
--           },
--         },
-- 			},
-- 		},
-- 		setup = {
-- 			copilot = function()
-- 				vim.schedule(function()
-- 					vim.lsp.inline_completion.enable()
-- 				end)
-- 				-- Accept inline suggestions or next edits
-- 				LazyVim.cmp.actions.ai_accept = function()
-- 					return vim.lsp.inline_completion.get()
-- 				end
--
-- 				if not LazyVim.has_extra("ai.sidekick") then
-- 					vim.lsp.config("copilot", {
-- 						handlers = {
-- 							didChangeStatus = function(err, res, ctx)
-- 								if err then
-- 									return
-- 								end
-- 								status[ctx.client_id] = res.kind ~= "Normal" and "error"
-- 									or res.busy and "pending"
-- 									or "ok"
-- 								if res.status == "Error" then
-- 									LazyVim.error("Please use `:LspCopilotSignIn` to sign in to Copilot")
-- 								end
-- 							end,
-- 						},
-- 					})
-- 				end
-- 			end,
-- 		},
-- 	},
-- }

return {
		"neovim/nvim-lspconfig",
		config = function(_, opts)
			-- Setup language servers.
			local lspconfig = require("lspconfig")
			local lsp = vim.lsp
			local handlers = lsp.handlers
			-- LSP settings (for overriding per client)
			local border = {
				{ "┌", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "┐", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "┘", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "└", "FloatBorder" },
				{ "│", "FloatBorder" },
			}
			-- local handlers = {
			--     ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
			--     ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			-- }
			-- local servers = {
			--     "tsserver",
			--     "html",
			--     -- "tailwindcss",
			--     "jsonls",
			--     "cssls",
			--     "angularls"
			-- }

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- -- tryign to get that sweet sweet inlay stuff by default (v10 feature of nvim)
			-- -- https://www.reddit.com/r/neovim/comments/14em0f8/how_to_use_the_new_lsp_inlay_hints/
			local on_attach = function(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					-- vim.lsp.inlay_hint.enable(bufnr)
					-- vim.lsp.inlay_hint.enable()
					vim.lsp.inlay_hint.enable(true)
					-- vim.lsp.inlay_hint.enable(bufnr, true)
					-- vim.lsp.inlay_hint.enable(bufnr, true)
					-- vim.lsp.inlay_hint.enable(true, nil)
					-- vim.lsp.inlay_hint.enable(true, bufnr)
					-- vim.lsp.buf.inlay_hint(bufnr, true)
				end
			end

			-- hmm, need to figure out how to get this to combine with my other stuff
			-- -- giving all my servers the capabilities on attach if they can dig it
			-- for _, server in ipairs(servers) do
			--     lspconfig[server].setup {
			--         on_attach = on_attach,
			--         capabilities = capabilities,
			--     }
			-- end

			-- opts = {
			--     inlay_hints = { enabled = true },
			-- }
			-- Hover doc popup
			local pop_opts = { border = "rounded", max_width = 80 }
			handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
			handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)


			-- This shows the function signature as I'm typing it :) suuuper valuable
			-- buuut ... maybe I can just use that addon instead? "ray-x/lsp_signature.nvim"
			-- yoinked from: https://www.reddit.com/r/neovim/comments/mdy1c8/function_signature_autocompletion_with_nvimcompe/
			-- other thoughts on in-time in-line signature_help https://neovim.discourse.group/t/show-signature-help-on-insert-mode/2007/5
			-- vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

			-- change diagnostic symbols in the sign column (gutter)
			--     error = "",
			--     warning = "",
			--     hint = "",
			--     information = "",
			--     other = "﫠"
			-- hint = "",
			-- -- info = "I",
			-- -- info = "info",
			-- info = "",
			-- -- warn = "!",
			-- -- warn = "warn",
			-- warn = "",
			-- -- error = "X",
			-- -- error = "error",
			-- error = "",
			local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Change prefix/character preceding the diagnostics' virutal text
			-- show source in diagnostics
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●", -- Could be '●', '▎', 'x'
					source = false,
				},
				float = {
					-- source = "always", -- Or "if_many"
					source = "if_many", -- Or "if_many"
				},
			})

			-- customize how diagnostics are displayed
			vim.diagnostic.config({
				-- virtual_text = true,
				signs = {
					-- severity = { "Error", "Warn" },
					severity = { "ERROR", "WARN" },
				},
				-- underline = true,
				-- update_in_insert = false,
				severity_sort = true,
			})

			vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
			vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

			-- local border = {
			--     { "🭽", "FloatBorder" },
			--     { "▔", "FloatBorder" },
			--     { "🭾", "FloatBorder" },
			--     { "▕", "FloatBorder" },
			--     { "🭿", "FloatBorder" },
			--     { "▁", "FloatBorder" },
			--     { "🭼", "FloatBorder" },
			--     { "▏", "FloatBorder" },
			-- }
			-- local border = {
			--     { "#", "FloatBorder" },
			--     { "─", "FloatBorder" },
			--     { "┐", "FloatBorder" },
			--     { "│", "FloatBorder" },
			--     { "┘", "FloatBorder" },
			--     { "─", "FloatBorder" },
			--     { "└", "FloatBorder" },
			--     { "│", "FloatBorder" },
			-- }

			-- border = { "│", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
			-- -- LSP settings (for overriding per client)
			-- local handlers = {
			--     ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
			--     ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			-- }

			-- To instead override globally
			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or border
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev) -- TODO: go
			-- QUESTION: sup
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next) -- DONE: sup
			-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist) -- LEARNING: hi

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					-- I suppsoe this is likek the built in dropdown thing which I don't even use?
					-- Consider commenting this out
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					-- local opts = { buffer = ev.buf }
					opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					-- This conflicts with my better vim pane movements where I do C-k instead of C-w then k
					-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
					-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<space>f", function()
						-- vim.lsp.buf.format({ async = true })
						-- require("conform").format({ buffnr = ev.buf })
					end, opts)

					-- Inlay Hints
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					---@cast client -nil
					if client.server_capabilities.inlayHintProvider then
						-- vim.lsp.inlay_hint.enable(ev.buf, true)
						vim.lsp.inlay_hint.enable(true)
						-- vim.lsp.inlay_hint.enable(0, true)
						-- vim.lsp.inlay_hint.enable()
					else
						-- vim.lsp.inlay_hint.enable(ev.buf, false)
						vim.lsp.inlay_hint.enable(false)
						-- vim.lsp.inlay_hint.enable(0, false)
					end
				end,
			})
		end,
	}
