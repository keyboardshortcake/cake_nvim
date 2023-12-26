return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                -- follow latest release.
                version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                -- install jsregexp (optional!).
                build = "make install_jsregexp"
            },
        },
        opts = function()
            vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

            require('luasnip.loaders.from_vscode').lazy_load()

            local cmp = require('cmp')
            local luasnip = require('luasnip')

            local select_opts = { behavior = cmp.SelectBehavior.Select }

            return {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                sources = {
                    { name = 'path' },
                    { name = 'buffer'},
                    { name = 'nvim_lua'},
                    { name = 'nvim_lsp', keyword_length = 1 },
                    { name = 'buffer',   keyword_length = 3 },
                    { name = 'luasnip',  keyword_length = 2 },
                },
                window = {
                    documentation = cmp.config.window.bordered()
                },
                formatting = {
                    fields = { 'menu', 'abbr', 'kind' },
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = 'λ-nvim',
                            luasnip = '⋗-lua',
                            buffer = 'Ω-buffer',
                            path = '🖫-path',
                        }

                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },
                mapping = {
                    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
                    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

                    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
                    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),

                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),

                    ['<C-f>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    ['<C-b>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    ['<Tab>'] = cmp.mapping(function(fallback)
                        local col = vim.fn.col('.') - 1

                        if cmp.visible() then
                            cmp.select_next_item(select_opts)
                        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                            fallback()
                        else
                            cmp.complete()
                        end
                    end, { 'i', 's' }),

                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item(select_opts)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },

            }
        end,
        config = function(_, opts)
        end,


    },
    {
		  'hrsh7th/cmp-path',
          -- config = true,
    },
    {
		  'hrsh7th/cmp-buffer',
          -- config = true,
    },
    {
      'hrsh7th/cmp-nvim-lsp',
    },
    {
		  'hrsh7th/cmp-nvim-lua',
    }
}
