require("mason-lspconfig").setup {
  ensure_installed = {
    'tsserver',
    'eslint',
    -- 'eslint-lsp',
    -- 'eslint_d',
    "cssls",
    "html",
    "jsonls",
    "yamlls",
    "eslint",
    "angularls",
    "pyright",
    -- "sumneko_lua",
    "lua_ls",
    -- "lua-language-server",
  },
  automatic_installation = true,
}

-- return {
--     'williamboman/mason.nvim',
--     opts = function()
--     end,
--     config = function(_, opts)
--     end
-- }
