require("mason-lspconfig").setup {
  ensure_installed = {
    'tsserver', 
    'eslint',
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
