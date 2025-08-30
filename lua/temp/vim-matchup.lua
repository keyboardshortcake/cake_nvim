return {
	"andymass/vim-matchup",
	event = "CursorMoved",
	config = function()
		vim.g.matchup_matchparen_offscreen = { method = "popup" }
		-- require("nvim-treesitter.configs").setup({
		-- 	matchup = {
		-- 		enable = true, -- mandatory, false will disable the whole extension
		-- 		disable = { "c", "ruby" }, -- optional, list of language that will be disabled
		-- 		-- [options]
		-- 	},
		-- })
	end,
}

-- not sure where this goes, what is that lvim global?
-- think this goes in config.lua
-- enable treesitter integration
-- lvim.builtin.treesitter.matchup.enable = true
