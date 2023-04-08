require("neo-tree").setup({
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
})
