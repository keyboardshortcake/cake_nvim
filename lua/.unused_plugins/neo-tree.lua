return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
        {
            's1n7ax/nvim-window-picker',
            version = '2.*',
            config = function()
                require 'window-picker'.setup({
                    filter_rules = {
                        include_current_win = false,
                        autoselect_one = true,
                        -- filter using buffer options
                        bo = {
                            -- if the file type is one of following, the window will be ignored
                            filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                            -- if the buffer type is one of following, the window will be ignored
                            buftype = { 'terminal', "quickfix" },
                        },
                    },
                })
            end,
        },
    },
        opts = {
            enable_git_status = true,
            -- use_popups_for_input = false,
            enable_diagnostics = true,
            default_component_configs = {
                diagnostics = {
                    symbols = {
                        -- hint = "Hint",
                        -- hint = "hint",
                        -- hint = "",
                        -- info = "I",
                        -- info = "info",
                        info = "",
                        -- warn = "!",
                        -- warn = "warn",
                        warn = "",
                        -- error = "X",
                        -- error = "error",
                        error = "",
                    },
                    highlights = {
                        hint = "DiagnosticSignHint",
                        info = "DiagnosticSignInfo",
                        warn = "DiagnosticSignWarn",
                        error = "DiagnosticSignError",
                    },
                },
            }

        }
}
