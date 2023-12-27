return {
    {
      "williamboman/mason.nvim",
      opts = {},
    },
    {
      'williamboman/mason-lspconfig.nvim',
      -- opts = function()
      -- end,
        opts = {
            ensure_installed = {
                "lua_ls",
                "cssls",
                "html",
                "tsserver",
                "pyright",
                "bashls",
                "jsonls",
                "yamlls",
                "eslint", -- added new eslint server, hopefully
                "angularls", -- hopefully added angular server? yikes I don't know what hte correct name is
            },
            automatic_installation = true,
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

        },
      config = function(_, opts)
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
      end,
    },
    {
      "neovim/nvim-lspconfig",
      opts = function()
      end,
      config = function(_, opts)
            -- Setup language servers.
            local lspconfig = require('lspconfig')
            -- lspconfig.pyright.setup {}
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }
            lspconfig.angularls.setup {}
            lspconfig.quick_lint_js.setup {
            }
            lspconfig.tsserver.setup {
                  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "ts", "typescript.ts", "component.ts" },
                  -- handlers = {
                  --       ['textDocument/definition'] = function(err, result, method, ...)
                  --           if vim.tbl_islist(result) and #result > 0 then
                  --               local filtered_result = filter(result, filterReactDTS)
                  --               return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
                  --           end
                  --
                  --           vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
                  --       end
                  -- },
                  settings = {
                      typescript = {
                          format = {
                              semicolons = 'insert',
                              -- trimTrailingWhitespace = true,
                              -- newLineCharacter = 'swag';
                          },
                      },
                      completions = {
                          completeFunctionCalls = true
                      },
                  },
                        -- handlers = {
                        --     ['textDocument/definition'] = function(err, result, method, ...)
                        --         local function dump(o)
                        --             if type(o) == 'table' then
                        --                 local s = '{ '
                        --                 for k, v in pairs(o) do
                        --                     if type(k) ~= 'number' then k = '"' .. k .. '"' end
                        --                     s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
                        --                 end
                        --                 return s .. '} '
                        --             else
                        --                 return tostring(o)
                        --             end
                        --         end
                        --         vim.notify(dump(result))
                        --     end
                        -- },
            }
            -- lspconfig.rust_analyzer.setup {
            --   -- Server-specific settings. See `:help lspconfig-setup`
            --   settings = {
            --     ['rust-analyzer'] = {},
            --   },
            -- }


            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
              group = vim.api.nvim_create_augroup('UserLspConfig', {}),
              callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>f', function()
                  vim.lsp.buf.format { async = true }
                end, opts)
              end,
            })
      end
    }
}
