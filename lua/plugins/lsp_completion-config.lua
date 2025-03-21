return {
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            -- {
            --     "rafamadriz/friendly-snippets"
            -- },
            {
                'saadparwaiz1/cmp_luasnip',
                -- follow latest release.
                version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                -- install jsregexp (optional!).
                -- build = "make install_jsregexp",
            },

        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            -- friendly-snippets - enable standardized comments snippets
            -- are these actually snippets? i don't really use snippets :-/
            -- on second thought, might just be my vm lol
            -- hmm, are they slowing down nvim? not sure, maybe
            -- require("luasnip").filetype_extend("typescript", { "tsdoc" })
            -- require("luasnip").filetype_extend("javascript", { "jsdoc" })
            -- require("luasnip").filetype_extend("lua", { "luadoc" })
            -- require("luasnip").filetype_extend("python", { "pydoc" })
            -- require("luasnip").filetype_extend("rust", { "rustdoc" })
            -- require("luasnip").filetype_extend("cs", { "csharpdoc" })
            -- require("luasnip").filetype_extend("java", { "javadoc" })
            -- require("luasnip").filetype_extend("c", { "cdoc" })
            -- require("luasnip").filetype_extend("cpp", { "cppdoc" })
            -- require("luasnip").filetype_extend("php", { "phpdoc" })
            -- require("luasnip").filetype_extend("kotlin", { "kdoc" })
            -- require("luasnip").filetype_extend("ruby", { "rdoc" })
            -- require("luasnip").filetype_extend("sh", { "shelldoc" })
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'hrsh7th/cmp-cmdline' },
            { 'dmitmel/cmp-cmdline-history' },
            { "lukas-reineke/cmp-rg" },
            { "hrsh7th/cmp-nvim-lua" },
        },
        opts = function()
            local has_words_before = function()
                -- unpack = unpack or table.unpack
                unpack = unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local luasnip = require("luasnip")
            local cmp = require("cmp")
            return {
                -- Disabling completion in comments and also not breaking telescope per:
                -- https://github.com/hrsh7th/nvim-cmp/pull/676#issuecomment-1724981778
                enabled = function()
                    local context = require("cmp.config.context")
                    local disabled = false
                    disabled = disabled or (vim.api.nvim_buf_get_option(0, "buftype") == "prompt")
                    disabled = disabled or (vim.fn.reg_recording() ~= "")
                    disabled = disabled or (vim.fn.reg_executing() ~= "")
                    disabled = disabled or context.in_treesitter_capture("comment")
                    return not disabled
                end,
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)                      -- when you click on a snippet you want to expand, it runs this function
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                -- https://www.reddit.com/r/neovim/comments/1139ngo/how_to_make_nvimcmp_menu_selection_start_at_the/
                -- preselect = cmp.PreselectMode.None,
                -- completion = { completeopt = "noselect" },
                -- https://github.com/pynappo/dotfiles/blob/ac8991f39b16da220b5fc582346c1583f4411348/.config/nvim/lua/pynappo/plugins/cmp.lua#L55
                -- completion = { completeopt = 'menu,menuone,noinsert,noselect' },
                mapping = cmp.mapping.preset.insert({

                    -- ... Your other mappings ...
                    -- TEMPORARILY disabling to see if I don't need it anymore

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                            -- that way you will only jump inside the snippet region
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    -- ... Your other mappings ...

                    -- ... Your other configuration ...

                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    -- ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    -- Copilot Source
                    { name = "copilot", group_index = 2 },
                    -- Other sources
                    { name = 'nvim_lsp' },
                    { name = "path" },
                    { name = 'luasnip' }, -- For luasnip users.
                    { name = 'nvim_lsp_document_symbol' },
                    { name = 'nvim_lsp_signature_help' },
                    {
                        name = "rg",
                        -- Try it when you feel cmp performance is poor
                        keyword_length = 3
                    },
                    { name = "nvim_lua" },
                }, {
                    { name = 'buffer', keyword_length = 3 },
                }),
                formatting = {
                    -- changing the order of fields so the icon is the first
                    fields = { 'menu', 'abbr', 'kind' },

                    -- here is where the change happens
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = 'λ',
                            luasnip = '⋗',
                            buffer = 'Ω',
                            path = '🖫',
                            nvim_lua = 'Π',
                            Copilot = "",
                        }

                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },
                {
                    view = "custom" -- or 'custom' or 'wildmenu' or 'native'
                },
            }
        end,
        config = function(_, opts)
            local cmp = require('cmp')
            cmp.setup(opts)
            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                }, {
                    { name = 'buffer' },
                })
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            function setAutoCmp(mode)
                if mode then
                    cmp.setup({
                        completion = {
                            autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged }
                        }
                    })
                else
                    cmp.setup({
                        completion = {
                            autocomplete = false
                        }
                    })
                end
            end

            -- setAutoCmp(false)
            setAutoCmp(true)

            -- enable automatic completion popup on typing
            -- vim.cmd('command AutoCmpOn lua setAutoCmp(true)')

            -- disable automatic competion popup on typing
            -- vim.cmd('command AutoCmpOff lua setAutoCmp(false)')

            -- https://www.reddit.com/r/neovim/comments/139s0a2/how_to_setup_nvimcmp_properly/
            -- Basically if you have cmp.config.sources({ {1}, {2} }), you will first see suggestions from the source 1, then only after you run out of suggestions from 1 will you start to see suggestions from the source 2.
            --
            -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'cmdline' }
                }, {
                    { name = 'path' }
                })
            })

            -- -- I keep running into annoyances using this, where I'm stuck trying to tab over to the next item but it wont
            -- cmp.setup.cmdline(':', {
            --     -- not sure if these actually work though: https://github.com/hrsh7th/nvim-cmp/issues/530
            --     -- confirmation = { completeopt = 'menu,menuone,noinsert' },
            --     confirmation = { completeopt = 'menu,menuone,noinsert,noselect' },
            --     -- confirmation = { completeopt = 'noinsert, noselect' },
            --     mapping = cmp.mapping.preset.cmdline(),
            --     sources = cmp.config.sources({
            --         { name = 'path' },
            --     }, {
            --         { name = 'cmdline' },
            --         -- { name = 'cmdline_history' },
            --     }, {
            --         { name = 'cmdline_history' },
            --     })
            -- })
            -- cmp.setup.cmdline(':', {
            --     confirmation = { completeopt = 'menu,menuone,noinsert' },
            --     mapping = cmp.mapping.preset.cmdline(),
            --     sources = cmp.config.sources({
            --         { name = 'cmdline' },
            --         { name = 'cmdline_history' },
            --         { name = 'path' },
            --     })
            -- })
        end
    },
}
