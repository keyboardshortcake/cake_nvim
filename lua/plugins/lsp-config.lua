return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = function()
            return {
                ensure_installed = {
                    "lua_ls",
                    "cssls",
                    "html",
                    "tsserver",
                    "pyright",
                    "bashls",
                    "jsonls",
                    "yamlls",
                    "eslint",           -- added new eslint server, hopefully
                    "angularls@14.0.0", -- work project is on angular cli 13.3.9 and angular 13.3.11 :shrug:
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
            require('mason-lspconfig').setup(opts)

            -- local masonLspconfig = require('mason-lspconfig")
            -- masonLspconfig.setup(opts)
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function(_, opts)
            -- Setup language servers.
            local lspconfig = require('lspconfig')
            local lsp = vim.lsp
            local handlers = lsp.handlers

            -- Hover doc popup
            local pop_opts = { border = "rounded", max_width = 80 }
            handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
            handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- local cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path}
            -- local cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" }
            -- lspconfig.pyright.setup {}
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }
            lspconfig.angularls.setup {
                capabilities = capabilities
                -- cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
                -- -- cmd = cmd,
                -- on_new_config = function(new_config, new_root_dir)
                --     new_config.cmd = cmd
                -- end,
                -- root_dir = root_pattern("angular.json")
            }
            lspconfig.quick_lint_js.setup {
                capabilities = capabilities
            }

            -- local function filter(arr, fn)
            --     if type(arr) ~= "table" then
            --         return arr
            --     end
            --
            --     local filtered = {}
            --     for k, v in pairs(arr) do
            --         if fn(v, k, arr) then
            --             table.insert(filtered, v)
            --         end
            --     end
            --
            --     return filtered
            -- end
            --
            -- local function filterReactDTS(value)
            --     return string.match(value.filename, '%.d.ts') == nil
            -- end

            lspconfig.tsserver.setup {
                capabilities = capabilities,
                filetypes = { "typescript", "typescriptreact", "typescript.tsx", "ts", "typescript.ts", "component.ts" },
                -- handlers = {
                --     ['textDocument/definition'] = function(err, result, method, ...)
                --         if vim.tbl_islist(result) and #result > 0 then
                --             local filtered_result = filter(result, filterReactDTS)
                --             return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
                --         end
                --
                --         vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
                --     end
                -- },
                settings = {
                    diagnostics = true,
                    preferences = {
                        allowIncompleteCompletions = false,
                        allowRenameOfImportPath = false,
                        quotePreference = "auto",
                        includeInlayParameterNameHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        displayPartsForJSDoc = true,
                        generateReturnInDocTemplate = true,
                        includeInlayVariableTypeHints = true,
                        includeCompletionsForImportStatements = true,
                    },
                    typescript = {
                        hint = {
                            enable = true
                        },
                        inlayHints = {
                            includeInlayParameterNameHints = 'all',
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                        format = {
                            allowIncompleteCompletions = false,
                            allowRenameOfImportPath = false,
                            insertSpaceAfterCommaDelimiter = true,
                            semicolons = 'insert',
                            trimTrailingWhitespace = true,
                            -- newLineCharacter = 'swag';
                        },
                    },
                    javascript = {
                        hint = {
                            enable = true
                        },
                        inlayHints = {
                            includeInlayParameterNameHints = 'all',
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                        format = {
                            allowIncompleteCompletions = false,
                            allowRenameOfImportPath = false,
                            insertSpaceAfterCommaDelimiter = true,
                            semicolons = 'insert',
                            trimTrailingWhitespace = true,
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
            -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

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
                    -- This conflicts with my better vim pane movements where I do C-k instead of C-w then k
                    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
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
    },
    -- {
    --     "pmizio/typescript-tools.nvim",
    --     config = function()
    --         require("typescript-tools").setup {
    --             -- on_attach = function() ... end,
    --             -- handlers = { ... },
    --             -- ...
    --             settings = {
    --                 -- spawn additional tsserver instance to calculate diagnostics on it
    --                 separate_diagnostic_server = true,
    --                 -- "change"|"insert_leave" determine when the client asks the server about diagnostic
    --                 publish_diagnostic_on = "insert_leave",
    --                 -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
    --                 -- "remove_unused_imports"|"organize_imports") -- or string "all"
    --                 -- to include all supported code actions
    --                 -- specify commands exposed as code_actions
    --                 expose_as_code_action = {},
    --                 -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
    --                 -- not exists then standard path resolution strategy is applied
    --                 tsserver_path = nil,
    --                 -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
    --                 -- (see 💅 `styled-components` support section)
    --                 tsserver_plugins = {},
    --                 -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
    --                 -- memory limit in megabytes or "auto"(basically no limit)
    --                 tsserver_max_memory = "auto",
    --                 -- described below
    --                 -- https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md#workspacedidchangeconfiguration
    --                 tsserver_format_options = {
    --                     allowIncompleteCompletions = false,
    --                     allowRenameOfImportPath = false,
    --                     semicolons = "insert",
    --                     insertSpaceAfterCommaDelimiter = true,
    --                 },
    --                 tsserver_file_preferences = {
    --                     allowIncompleteCompletions = false,
    --                     allowRenameOfImportPath = false,
    --                     quotePreference = "auto",
    --                     includeInlayParameterNameHints = true,
    --                     includeInlayPropertyDeclarationTypeHints = true,
    --                     displayPartsForJSDoc = true,
    --                     generateReturnInDocTemplate = true,
    --                     includeInlayVariableTypeHints = true,
    --                     includeCompletionsForImportStatements = true,
    --                 },
    --                 -- locale of all tsserver messages, supported locales you can find here:
    --                 -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
    --                 tsserver_locale = "en",
    --                 -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
    --                 complete_function_calls = true,
    --                 include_completions_with_insert_text = true,
    --                 -- CodeLens
    --                 -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
    --                 -- possible values: ("off"|"all"|"implementations_only"|"references_only")
    --                 code_lens = "all",
    --                 -- by default code lenses are displayed on all referencable values and for some of you it can
    --                 -- be too much this option reduce count of them by removing member references from lenses
    --                 disable_member_code_lens = true,
    --                 -- JSXCloseTag
    --                 -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-auto-tag,
    --                 -- that maybe have a conflict if enable this feature. )
    --                 jsx_close_tag = {
    --                     enable = false,
    --                     filetypes = { "javascriptreact", "typescriptreact" },
    --                 },
    --             },
    --         }
    --     end
    -- },
    -- {
    --     "jose-elias-alvarez/typescript.nvim",
    --     configure = function()
    --         require("typescript").setup({
    --             disable_commands = false, -- prevent the plugin from creating Vim commands
    --             debug = false,            -- enable debug logging for commands
    --             go_to_source_definition = {
    --                 fallback = true,      -- fall back to standard LSP definition on failure
    --             },
    --             server = {                -- pass options to lspconfig's setup method
    --                 -- on_attach = ...,
    --             },
    --         })
    --     end
    -- },
    -- {
    --     "lvimuser/lsp-inlayhints.nvim",
    --     config = function()
    --         require("lsp-inlayhints").setup({
    --             inlay_hints = {
    --                 parameter_hints = {
    --                     show = true,
    --                     prefix = "<- ",
    --                     separator = ", ",
    --                     remove_colon_start = false,
    --                     remove_colon_end = true,
    --                 },
    --                 type_hints = {
    --                     -- type and other hints
    --                     show = true,
    --                     prefix = "",
    --                     separator = ", ",
    --                     remove_colon_start = false,
    --                     remove_colon_end = false,
    --                 },
    --                 only_current_line = false,
    --                 -- separator between types and parameter hints. Note that type hints are
    --                 -- shown before parameter
    --                 labels_separator = "  ",
    --                 -- whether to align to the length of the longest line in the file
    --                 max_len_align = false,
    --                 -- padding from the left if max_len_align is true
    --                 max_len_align_padding = 1,
    --                 -- highlight group
    --                 highlight = "LspInlayHint",
    --                 -- virt_text priority
    --                 priority = 0,
    --             },
    --             enabled_at_startup = true,
    --             debug_mode = false,
    --         })
    --         vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
    --         vim.api.nvim_create_autocmd("LspAttach", {
    --             group = "LspAttach_inlayhints",
    --             callback = function(args)
    --                 if not (args.data and args.data.client_id) then
    --                     return
    --                 end
    --
    --                 local bufnr = args.buf
    --                 local client = vim.lsp.get_client_by_id(args.data.client_id)
    --                 require("lsp-inlayhints").on_attach(client, bufnr)
    --             end,
    --         })
    --     end
    -- }

}
