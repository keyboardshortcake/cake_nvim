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

-- local tsHandlers = {
--     ["textDocument/definition"] = function(_, result, params)
--         local util = require("vim.lsp.util")
--         if result == nil or vim.tbl_isempty(result) then
--             -- local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, "No location found")
--             return nil
--         end
--
--         if vim.tbl_islist(result) then
--             util.jump_to_location(result[1])
--
--             if #result > 1 then
--                 local isReactDTs = false
--                 ---@diagnostic disable-next-line: unused-local
--                 for key, value in pairs(result) do
--                     if string.match(value.uri, "react/index.d.ts") then
--                         isReactDTs = true
--                         break
--                     end
--                 end
--                 if not isReactDTs then
--                     util.set_qflist(util.locations_to_items(result))
--                     vim.api.nvim_command("copen")
--                     vim.api.nvim_command("wincmd p")
--                 end
--             end
--         else
--             util.jump_to_location(result)
--         end
--     end,
-- }

lsp.on_attach(function(client, bufnr)
  -- lsp.default_keymaps({
  --   buffer = bufnr, preserve_mappings = false
  -- })
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
-- local function filter(arr, fn)
--   if type(arr) ~= "table" then
--     return arr
--   end
--
--   local filtered = {}
--   for k, v in pairs(arr) do
--     if fn(v, k, arr) then
--       table.insert(filtered, v)
--     end
--   end
--
--   return filtered
-- end
--
-- local function filterReactDTS(value)
--   -- return string.match(value.uri, 'react/index.d.ts') == nil
--   return string.match(value.uri, 'dist/common.d.ts') == nil
-- end

-- local function filter(arr, fn)
--   if type(arr) ~= "table" then
--     return arr
--   end
--
--   local filtered = {}
--   for k, v in pairs(arr) do
--     if fn(v, k, arr) then
--       table.insert(filtered, v)
--     end
--   end
--
--   return filtered
-- end
--
-- local function filterReactDTS(value)
--   return string.match(value.uri, '%.d.ts') == nil
-- end
-- --
-- local function on_list(options)
--   local items = options.items
--   if #items > 1 then
--     items = filter(items, filterReactDTS)
--   end
-- --
--   vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
--   vim.api.nvim_command('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
-- end


-- require('lspconfig').tsserver.setup({
--    -- handlers = {
--    -- ['textDocument/definition'] = function(err, result, method, ...)
--    --   if vim.tbl_islist(result) and #result > 1 then
--    --     local filtered_result = filter(result, filterReactDTS)
--    --     return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
--    --   end
--    --
--    --   vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
--    -- end
--    handlers = {
--    ['textDocument/codeAction'] = function(err, result, method, ...)
--      if vim.tbl_islist(result) and #result > 1 then
--        local filtered_result = filter(result, filterReactDTS)
--        return vim.lsp.handlers['textDocument/codeAction'](err, filtered_result, method, ...)
--      end
--
--      vim.lsp.handlers['textDocument/codeAction'](err, result, method, ...)
--    end
--  }
--
-- 	-- handlers = {
-- 	-- 	-- pick the first response to a go to definition response. that way we go straight to the
-- 	-- 	-- source definition without needing to choose from the type definition .d.ts file
-- 	-- 	["textDocument/definition"] = function(err, result, ...)
-- 	-- 		result = vim.tbl_islist(result) and result[1] or result
-- 	-- 		vim.lsp.handlers["textDocument/definition"](err, result, ...)
-- 	-- 	end,
-- 	-- -- },
-- })

-- lspconfig.tsserver.setup({
-- 	capabilities = capabilities,
-- 	root_dir = util.root_pattern("tsconfig.json", "jsconfig.json"),
-- 	handlers = {
-- 		-- pick the first response to a go to definition response. that way we go straight to the
-- 		-- source definition without needing to choose from the type definition .d.ts file
-- 		["textDocument/definition"] = function(err, result, ...)
-- 			result = vim.tbl_islist(result) and result[1] or result
-- 			vim.lsp.handlers["textDocument/definition"](err, result, ...)
-- 		end,
-- 	},
-- })
local servers = {
  -- "sumneko_lua",
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "eslint", -- added new eslint server, hopefully
  "angularls", -- hopefully added angular server? yikes I don't know what hte correct name is
}

local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end
--
local function filterReactDTS(value)
  return string.match(value.uri, '%.d.ts') == nil
end

-- local function filter(arr, fn)
--   if type(arr) ~= "table" then
--     return arr
--   end
--
--   local filtered = {}
--   for k, v in pairs(arr) do
--     if fn(v, k, arr) then
--       table.insert(filtered, v)
--     end
--   end
--
--   return filtered
-- end

local function isNotDeclarationFile(value)
  return string.match(value.filename, '%.d.ts') == nil
end

-- local function on_list(options)
--   local items = options.items
--   if #items > 1 then
--     items = filter(items, filterReactDTS)
--   end
--
--   vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
--   vim.api.nvim_command('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
-- end

-- local function filter(arr, fn)
--   if type(arr) ~= "table" then
--     return arr
--   end
--
--   local filtered = {}
--   for _, value in pairs(arr) do
--     if fn(value) then
--       table.insert(filtered, value)
--     end
--   end
--
--   return filtered
-- end
--
-- local function isNotDeclarationFile(value)
--   -- return not string.match(value.uri, '%.d%.ts$')
--   return value.uri and not string.match(value.uri, '%.d.ts$')
-- end

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
  handlers = {
    -- lsp.default_setup,
    tsserver = function()
            require('lspconfig').tsserver.setup {
                -- handlers = {
                --     ['textDocument/definition'] = function(err, result, method, ...)
                --         -- if vim.tbl_islist(result) and #result > 0 then
                --             -- local filtered_result = filter(result, isNotDeclarationFile)
                --             vim.notify("sup")
                --             -- return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
                --         -- end
                --
                --         vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
                --     end
                -- },
                -- on_attach = on_attach,
                -- capabilities = capabilities,
                handlers = {
                    ['textDocument/definition'] = function(err, result, method, ...)
                        local function dump(o)
                            if type(o) == 'table' then
                                local s = '{ '
                                for k, v in pairs(o) do
                                    if type(k) ~= 'number' then k = '"' .. k .. '"' end
                                    s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
                                end
                                return s .. '} '
                            else
                                return tostring(o)
                            end
                        end
                        vim.notify(dump(result))
                    end
                },
            }
      -- require('lspconfig').tsserver.setup({
      --   filetypes = { "typescript", "typescriptreact", "typescript.tsx", "ts", "typescript.ts", "component.ts" },
      --   handlers = {
      --     ['textDocument/definition'] = function(err, result, method, ...)
      --       if vim.tbl_islist(result) and #result > 0 then
      --         local filtered_result = filter(result, isNotDeclarationFile)
      --         return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
      --       end
      --
      --       vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
      --     end
      --   },
      --   settings = {
      --     typescript = {
      --       format = {
      --         semicolons = 'insert',
      --       },
      --     },
      --     completions = {
      --       completeFunctionCalls = true
      --     },
      --   },
      -- })
    end,
  }
})

-- require("mason").setup({})
-- require("mason-lspconfig").setup({
--   ensure_installed = servers,
--   automatic_installation = true,
--   handlers = {
--       lsp.default_setup,
--       tsserver = function()
--           require('lspconfig').tsserver.setup({
--               filetypes = { "typescript", "typescriptreact", "typescript.tsx", "ts", "typescript.ts", "component.ts" },
--               handlers = {
--                     ['textDocument/definition'] = function(err, result, method, ...)
--                         if vim.tbl_islist(result) and #result > 0 then
--                             local filtered_result = filter(result, filterReactDTS)
--                             return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
--                         end
--
--                         vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
--                     end
--               },
--               settings = {
--                   typescript = {
--                       format = {
--                           semicolons = 'insert',
--                           -- trimTrailingWhitespace = true,
--                           -- newLineCharacter = 'swag';
--                       },
--                   },
--                   completions = {
--                       completeFunctionCalls = true
--                   },
--               },
--                 -- handlers = {
--                 --     ['textDocument/codeAction'] = function(err, result, method, ...)
--                 --         if vim.tbl_islist(result) and #result > 1 then
--                 --             local filtered_result = filter(result, filterReactDTS)
--                 --             return vim.lsp.handlers['textDocument/codeAction'](err, filtered_result, method, ...)
--                 --         end
--                 --
--                 --         vim.lsp.handlers['textDocument/codeAction'](err, result, method, ...)
--                 --     end
--                 -- },
--                 -- handlers = tsHandlers
--
--             })
--       end,
--   }
-- })

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

-- this is to git rid of the inline error things if I set virtual_text to false
-- testing from https://github.com/samhh/dotfiles/blob/99e67298fbcb61d7398ad1850f3c2df31d90bd0d/home/.config/nvim/plugin/lsp.lua#L120
-- via https://www.reddit.com/r/neovim/comments/og1cdv/comment/hi3muw7/?utm_source=reddit&utm_medium=web2x&context=3
local function setup_diags()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
    }
  )
end
setup_diags()

--




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
