return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = function()
        -- --- You can override specific color groups to use other groups or a hex color
        -- --- function will be called with a ColorScheme table
        -- ---@param colors ColorScheme
        -- on_colors = function(colors) end,
        --
        -- --- You can override specific highlights to use other groups or a hex color
        -- --- function will be called with a Highlights and ColorScheme table
        -- ---@param highlights Highlights
        -- ---@param colors ColorScheme
        --
        -- on_highlights = function(highlights, colors) end

        return {
            on_highlights = function(highlights, colors)
                highlights.DiagnosticVirtualTextHint = {
                    bg = "#1a2b32",
                    -- bg = "green",
                    fg = "#1abc9c",
                    -- bg = "#233745",
                    -- fg = "#1abc9c",
                    undercurl = true,

                }
                highlights.DiagnosticError = {
                    fg = "#db4b4b",
                    -- fg = "blue",
                    undercurl = true,
                }
                -- colors.hint = colors.orange
                --     colors.error = "#ff0000"
            end,
            integrations = {
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { italic = true },
                        hints = { italic = true },
                        warnings = { italic = true },
                        information = { italic = true },
                    },
                    underlines = {
                        errors = { undercurl = true },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
            },
            -- your configuration comes here
            -- or leave it empty to use the default settings
            style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            -- light_style = "night",    -- The theme is used when the background is set to light
            transparent = false,    -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = false },
                keywords = { italic = false },
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "dark",            -- style for sidebars, see below
                floats = "dark",              -- style for floating windows
            },
            sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
            day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            -- day_brightness = 1,
            hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = false,             -- dims inactive windows
            lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold

        }
    end,
    config = function(_, opts)
        -- vim.cmd('colorscheme tokyonight-storm')
        require('tokyonight').setup(opts)
        vim.cmd('colorscheme tokyonight-night')
    end
}
