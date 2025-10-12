-- require("mason").setup({
--     ui = {
--         icons = {
--             package_installed = "✓",
--             package_pending = "➜",
--             package_uninstalled = "✗"
--         }
--     }
-- })

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function()
			return {
				highlight = {
					enable = true,
					disable = "help",
				},
				ensure_installed = {
					-- "vimdoc",
					-- "luadoc",
					-- "vim",
					-- "lua",
					-- "markdown",
					-- "lua_ls",
					-- "cssls",
					-- "vimls",
					-- "html",
					-- "tsserver",
					-- "ts_ls",
					-- "pyright",
					-- "bashls",
					-- "jsonls",
					-- "yamlls",
					-- "eslint", -- added new eslint server, hopefully
					-- "vtsls",
					-- "eslintls",
					-- "eslintlsp",
					-- "angularls@14.0.0", -- work project is on angular cli 13.3.9 and angular 13.3.11 :shrug:
					-- "phpactor",
					-- "vuels",
					-- "intelephense",
					-- "marksman",
					-- "vint",
				},
				automatic_installation = true,
			}
			-- handlers = {
			--     -- lsp.default_setup,
			--     tsserver = function()
			--         require('lspconfig').tsserver.setup {
			--             handlers = {
			--                 ['textDocument/definition'] = function(err, result, method, ...)
			--                     local function dump(o)
			--                         if type(o) == 'table' then
			--                             local s = '{ '
			--                             for k, v in pairs(o) do
			--                                 if type(k) ~= 'number' then k = '"' .. k .. '"' end
			--                                 s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
			--                             end
			--                             return s .. '} '
			--                         else
			--                             return tostring(o)
			--                         end
			--                     end
			--                     vim.notify(dump(result))
			--                 end
			--             },
			--         }
			--     end,
			-- }
		end,
		config = function(_, opts)
			-- this is to git rid of the inline error things if I set virtual_text to false
			-- testing from https://github.com/samhh/dotfiles/blob/99e67298fbcb61d7398ad1850f3c2df31d90bd0d/home/.config/nvim/plugin/lsp.lua#L120
			-- via https://www.reddit.com/r/neovim/comments/og1cdv/comment/hi3muw7/?utm_source=reddit&utm_medium=web2x&context=3
			-- local function setup_diags()
			--     vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
			--         vim.lsp.diagnostic.on_publish_diagnostics,
			--         {
			--             virtual_text = true,
			--             signs = true,
			--             update_in_insert = false,
			--             underline = true,
			--         }
			--     )
			-- end
			-- setup_diags()
			require("mason-lspconfig").setup(opts)

			-- local masonLspconfig = require('mason-lspconfig")
			-- masonLspconfig.setup(opts)
		end,
	},
}

