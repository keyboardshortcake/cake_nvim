   return {
        "kevinhwang91/nvim-ufo",
        lazy = true,
        event = "BufReadPost",
        enabled = true,
        dependencies = { "kevinhwang91/promise-async",
            -- {
            --     "luukvbaal/statuscol.nvim",
            --     config = function(_, opts)
            --         local builtin = require("statuscol.builtin")
            --         require("statuscol").setup(
            --
            --             {
            --                 relculright = true,
            --                 segments = {
            --                     {
            --                         sign = { name = { "Dap*" }, maxwidth = 1, colwidth = 2, auto = true, fillchars = "" },
            --                         click = "v:lua.ScSa",
            --                     },
            --                     {
            --                         sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
            --                         click = "v:lua.ScSa"
            --                     },
            --
            --                     {
            --                         sign = { namespace = { "gitsigns" }, colwidth = 1, wrap = true },
            --                         click = "v:lua.ScSa"
            --                     },
            --                     -- {text = { builtin.foldfunc }, click = "v:lua.ScFa"},
            --                     { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            --                 }
            --
            --             }
            --         )
            --     end
            --
            -- }
        },
        config = function(_, opts)
            local ftMap = {
                vim = 'indent',
                python = {'indent'},
                git = ''
            }
            require('ufo').setup({
                open_fold_hl_timeout = 150,
                close_fold_kinds_for_ft = {
                    default = {'imports', 'comment'},
                    json = {'array'},
                    c = {'comment', 'region'}
                },
                preview = {
                    win_config = {
                        border = {'', '─', '', '', '', '─', '', ''},
                        winhighlight = 'Normal:Folded',
                        winblend = 0
                    },
                    mappings = {
                        scrollU = '<C-u>',
                        scrollD = '<C-d>',
                        jumpTop = '[',
                        jumpBot = ']'
                    }
                },
                provider_selector = function(bufnr, filetype, buftype)
                    -- if you prefer treesitter provider rather than lsp,
                    -- return ftMap[filetype] or {'treesitter', 'indent'}
                    return ftMap[filetype]

                    -- refer to ./doc/example.lua for detail
                end
            })
            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
            vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
            vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
            vim.keymap.set('n', 'K', function()
                local winid = require('ufo').peekFoldedLinesUnderCursor()
                if not winid then
                    -- choose one of coc.nvim and nvim lsp
                    vim.fn.CocActionAsync('definitionHover') -- coc.nvim
                    vim.lsp.buf.hover()
                end
            end)
            -- vim.o.foldcolumn = "1" -- '0' is not bad
            -- vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
            -- vim.o.foldlevelstart = 99
            -- vim.o.foldenable = true
            -- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
            --
            -- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            -- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

            local handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = (' 󰦸 %d '):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, { chunkText, hlGroup })
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, { suffix, 'MoreMsg' })
                return newVirtText
            end

            -- global handler
            -- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
            -- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
            require('ufo').setup({
                fold_virt_text_handler = handler
            })
            -- buffer scope handler
            -- will override global handler if it is existed
            -- local bufnr = vim.api.nvim_get_current_buf()
            -- require('ufo').setFoldVirtTextHandler(bufnr, handler)
        end
    }
    -- {
    --     'Sam-programs/cmdline-hl.nvim',
    --     event = 'UiEnter',
    --     dev = false,
    --     opts = {
    --         -- table used for prefixes
    --         type_signs = {
    --             [":"] = { ":", "FloatFooter" },
    --             ["/"] = { "/", "FloatFooter" },
    --             ["?"] = { "? ", "FloatFooter" },
    --             ["="] = { "=", "FloatFooter" },
    --         },
    --         custom_types = {
    --             -- ["command-name"] = {
    --             -- [icon],[icon_hl], default to `:` icon and highlight
    --             -- [lang], defaults to vim
    --             -- [showcmd], defaults to false
    --             -- [pat], defaults to "%w*%s*(.*)"
    --             -- [code], defaults to nil
    --             -- }
    --             -- lang is the treesitter language to use for the commands
    --             -- showcmd is true if the command should be displayed or to only show the icon
    --             -- pat is used to extract the part of the command that needs highlighting
    --             -- the part is matched against the raw command you don't need to worry about ranges
    --             -- e.g. in 's,>'s/foo/bar/
    --             -- pat is checked against s/foo/bar
    --             -- you could also use the 'code' function to extract the part that needs highlighting
    --             ["lua"] = { icon = " ", icon_hl = "FloatFooter", lang = "lua" },
    --             ["="] = { icon = " ", icon_hl = "FloatFooter", lang = "lua" },
    --             ["help"] = { icon = "? ", icon_hl = "FloatFooter" },
    --             ["substitute"] = { pat = "%w(.*)", lang = "regex", show_cmd = true },
    --         },
    --         input_hl = "FloatFooter",
    --         -- used to highlight the range in the command e.g. '<,>' in '<,>'s
    --         range_hl = "FloatBorder",
    --     },
    --     -- highlight used for vim.input
    --     input_hl = "FloatFooter",
    -- }
