return {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = function()
        return {
            options = {
                close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
                right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
                -- offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
                offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
                separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
            },

        }
    end,
    config = function(_, opts)
        local status_ok, bufferline = pcall(require, "bufferline")
        if not status_ok then
          return
        end

        bufferline.setup(opts)

        vim.g.transparent_groups = vim.list_extend(
          vim.g.transparent_groups or {},
          vim.tbl_map(function(v)
            return v.hl_group
          end, vim.tbl_values(require('bufferline.config').highlights))
        )

    end,
}
