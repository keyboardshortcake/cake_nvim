return {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
}

-- not sure where this goes, what is that lvim global?
-- think this goes in config.lua
-- enable treesitter integration
-- lvim.builtin.treesitter.matchup.enable = true
