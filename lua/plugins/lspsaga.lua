return {
    "glepnir/lspsaga.nvim", -- not sure what this does, is it a sidebar thing for outlining the file?
    event = "LspAttach",
    opts = {
        ui = {
          -- This option only works in Neovim 0.9
          title = true,
          -- Border type can be single, double, rounded, solid, shadow.
          border = "single",
          winblend = 0,
          expand = "",
          collapse = "",
          code_action = "💡",
          -- code_action = "",
          incoming = " ",
          outgoing = " ",
          hover = ' ',
          kind = {},
        }
    },
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  }
