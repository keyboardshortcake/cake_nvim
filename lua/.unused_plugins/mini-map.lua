return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.map").setup(
			-- No need to copy this inside `setup()`. Will be used automatically.
			{
				-- Highlight integrations (none by default)
				-- integrations = nil,
                integrations = {
                    -- map.gen_integration.builtin_search(),
                    -- map.gen_integration.diff(),
                    -- map.ge_integration.diagnostic(),
                },

				-- Symbols used to display data
				symbols = {
					-- Encode symbols. See `:h MiniMap.config` for specification and
					-- `:h MiniMap.gen_encode_symbols` for pre-built ones.
					-- Default: solid blocks with 3x2 resolution.
					encode = nil,

					-- Scrollbar parts for view and line. Use empty string to disable any.
					scroll_line = "█",
					scroll_view = "┃",
				},

				-- Window options
				window = {
					-- Whether window is focusable in normal way (with `wincmd` or mouse)
					-- focusable = false,
					focusable = true,

					-- Side to stick ('left' or 'right')
					side = "right",

					-- Whether to show count of multiple integration highlights
					show_integration_count = true,

					-- Total width
					width = 10,

					-- Value of 'winblend' option
					winblend = 25,

					-- Z-index
					zindex = 10,
				},
			}
		)
	end,
}
