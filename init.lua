-- plugins
require("plugins.lazy")
require("plugins.telescope")
require("plugins.trouble")
require("plugins.bufferline")
require("plugins.alpha")

-- were these missing? Lets add and see what happens
require("plugins.project")
require("plugins.undotree")
require("plugins.lsp")
require("plugins.illuminate")
require("plugins.neo-tree")
require("plugins.nvim-cmp")
-- require("plugins.nvim-cmp2")
require("plugins.lspsaga")
-- require("plugins.nvim-tree")

-- configs
require("config.options")
require("config.keymaps")

-- themes
require("theme.tokyonight") -- I like the tokyonight-night theme best (different from regular tokyonight)
-- require("theme.transparent")
-- require("theme.rose-pine")
