local lsp = require('lsp-zero').preset({})

-- without this, I get lint errors for vim being an unrecognized global
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                 globals = { 'vim' }
            }
        }
    }
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false
  })
  -- lsp.default_keymaps({buffer = bufnr})
end)

-- -- When you don't have mason.nvim installed
-- -- You'll need to list the servers installed in your system
-- lsp.setup_servers({
--   'tsserver', 
--   'eslint',
--   "cssls",
--   "html",
--   "jsonls",
--   "yamlls",
--   "eslint",
--   "angularls",
--   "pyright",
--   -- "sumneko_lua",
--   "lua_ls",
--   -- "lua-language-server",
-- })

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()


-- now setup cmp
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})





-- local servers = {
--   "sumneko_lua",
--   "cssls",
--   "html",
--   "tsserver",
--   "pyright",
--   "bashls",
--   "jsonls",
--   "yamlls",
--   "eslint", -- added new eslint server, hopefully
--   "angularls", -- hopefully added angular server? yikes I don't know what hte correct name is
-- }
--
-- local settings = {
--   ui = {
--     border = "none",
--     icons = {
--       package_installed = "◍",
--       package_pending = "◍",
--       package_uninstalled = "◍",
--     },
--   },
--   log_level = vim.log.levels.INFO,
--   max_concurrent_installers = 4,
-- }
--
-- require("mason").setup(settings)
-- require("mason-lspconfig").setup({
--   ensure_installed = servers,
--   automatic_installation = true,
-- })
--
-- local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
-- if not lspconfig_status_ok then
--   return
-- end   Rishabh • Fri 07 Oct 2022 10:50:06 PM UTC • updated the whole config (except dap) for neovim 0.8 (#53)
--
-- local opts = {}
--
-- for _, server in pairs(servers) do
--   opts = {
--     on_attach = require("user.lsp.handlers").on_attach,
--     capabilities = require("user.lsp.handlers").capabilities,
--   }
--  
--   server = vim.split(server, "@")[1]
--  
--   local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
--   if require_ok then
--     opts = vim.tbl_deep_extend("force", conf_opts, opts)
--   end
--  
--   lspconfig[server].setup(opts)
-- end
--
