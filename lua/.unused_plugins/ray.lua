-- This shows the function signature as I'm typing it, cool addon
-- return { --lazy specific setup
--     "ray-x/lsp_signature.nvim",
--     event = "VeryLazy",
--     opts = {
--         hint_inline = function() return true end, -- should the hint be inline(nvim 0.10 only)?  default false
--         hint_enable = false,                      -- virtual hint enable
--     },
--     config = function(_, opts)
--         require 'lsp_signature'.setup(opts)
--     end
-- }

return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    bind = true,
    handler_opts = {
      border = "rounded"
    }
  },
  -- or use config
  -- config = function(_, opts) require'lsp_signature'.setup({you options}) end
}
