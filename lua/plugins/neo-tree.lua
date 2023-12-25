return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim",
    },
        opts = {
            enable_git_status = false,
            -- use_popups_for_input = false,
            -- enable_diagnostics = false,
            default_component_configs = {
                diagnostics = {
                    symbols = {
                        -- hint = "Hint",
                        hint = "hint",
                        -- info = "I",
                        info = "info",
                        -- warn = "!",
                        warn = "warn",
                        -- error = "X",
                        error = "error",
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
