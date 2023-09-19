-- local status_ok, 'lazy-lsp' = pcall(require, "lazy-lsp")
-- if not status_ok then
--   return
-- end
-- 
-- lazy-lsp.setup {}

require("lazy-lsp").setup({
  excluded_servers = {
    "ccls", "zk", "sqls"
  },
})
