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
                    "vimls",
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
            -- local servers = {
            --     "tsserver",
            --     "html",
            --     -- "tailwindcss",
            --     "jsonls",
            --     "cssls",
            --     "angularls"
            -- }

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- -- tryign to get that sweet sweet inlay stuff by default (v10 feature of nvim)
            -- -- https://www.reddit.com/r/neovim/comments/14em0f8/how_to_use_the_new_lsp_inlay_hints/
            local on_attach = function(client, bufnr)
                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(bufnr, true)
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

            -- Hover doc popup
            local pop_opts = { border = "rounded", max_width = 80 }
            handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
            handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)

            -- lspconfig.pyright.setup {}
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        runtime = {
                            version = "Lua 5.1"
                        },
                        ["completion.enable"] = false,
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }
            lspconfig.html.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            lspconfig.cssls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            -- lol mmkay worth a shot, but apparently this is not something that works lol
            -- lspconfig.cmakelang.setup {
            --     capabilities = capabilities,
            --     on_attach = on_attach,
            -- }
            lspconfig.vimls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            lspconfig.angularls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                -- cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" }
                -- -- cmd = cmd,
                -- on_new_config = function(new_config, new_root_dir)
                --     new_config.cmd = cmd
                -- end,
                -- root_dir = root_pattern("angular.json")
            }
            lspconfig.quick_lint_js.setup {
                capabilities = capabilities,
                on_attach = on_attach,
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
                on_attach = on_attach,
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
                    prefix = '●', -- Could be '●', '▎', 'x'
                    source = false,
                },
                float = {
                    source = "always", -- Or "if_many"
                },
            })


            -- customize how diagnostics are displayed
            vim.diagnostic.config({
                -- virtual_text = true,
                signs = {
                    severity = { "Error", "Warn" },
                },
                -- underline = true,
                -- update_in_insert = false,
                severity_sort = true,
            })

            vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
            vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

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
            local border = {
                { "#", "FloatBorder" },
                { "─", "FloatBorder" },
                { "┐", "FloatBorder" },
                { "│", "FloatBorder" },
                { "┘", "FloatBorder" },
                { "─", "FloatBorder" },
                { "└", "FloatBorder" },
                { "│", "FloatBorder" },
            }

            -- border = { "│", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
            -- -- LSP settings (for overriding per client)
            -- local handlers = {
            --     ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
            --     ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
            -- }

            -- Do not forget to use the on_attach function
            -- require 'lspconfig'.myserver.setup { handlers = handlers }

            -- To instead override globally
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            -- -- this is from the docs, testing
            -- vim.diagnostic.handlers["my/notify"] = {
            --     show = function(namespace, bufnr, diagnostics, opts)
            --         -- In our example, the opts table has a "log_level" option
            --         local level = opts["my/notify"].log_level
            --
            --         local name = vim.diagnostic.get_namespace(namespace).name
            --         local msg = string.format("%d diagnostics in buffer %d from %s",
            --             #diagnostics,
            --             bufnr,
            --             name)
            --         vim.notify(msg, level)
            --     end,
            -- }

            -- -- Create a custom namespace. This will aggregate signs from all other
            -- -- namespaces and only show the one with the highest severity on a
            -- -- given line
            -- local ns = vim.api.nvim_create_namespace("my_namespace")
            --
            -- -- Get a reference to the original signs handler
            -- local orig_signs_handler = vim.diagnostic.handlers.signs
            --
            -- -- Override the built-in signs handler
            -- vim.diagnostic.handlers.signs = {
            --     show = function(_, bufnr, _, opts)
            --         -- Get all diagnostics from the whole buffer rather than just the
            --         -- diagnostics passed to the handler
            --         local diagnostics = vim.diagnostic.get(bufnr)
            --
            --         -- Find the "worst" diagnostic per line
            --         local max_severity_per_line = {}
            --         for _, d in pairs(diagnostics) do
            --             local m = max_severity_per_line[d.lnum]
            --             if not m or d.severity < m.severity then
            --                 max_severity_per_line[d.lnum] = d
            --             end
            --         end
            --
            --         -- Pass the filtered diagnostics (with our custom namespace) to
            --         -- the original handler
            --         local filtered_diagnostics = vim.tbl_values(max_severity_per_line)
            --         orig_signs_handler.show(ns, bufnr, filtered_diagnostics, opts)
            --     end,
            --     hide = function(_, bufnr)
            --         orig_signs_handler.hide(ns, bufnr)
            --     end,
            -- }


            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev) -- TODO: go
            -- QUESTION: sup
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next) -- DONE: sup
            -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist) -- LEARNING: hi

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    -- I suppsoe this is likek the built in dropdown thing which I don't even use?
                    -- Consider commenting this out
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
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     event = "BufRead",
    --     config = function() require "lsp_signature".on_attach() end,
    -- },
    { --lazy specific setup
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            hint_inline = function() return true end, -- should the hint be inline(nvim 0.10 only)?  default false
            hint_enable = false,                      -- virtual hint enable
        },
        config = function(_, opts)
            require 'lsp_signature'.setup(opts)
        end
    },
    {
        "tpope/vim-apathy",
    },

}
