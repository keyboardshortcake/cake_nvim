return {
    "aaronhallaert/advanced-git-search.nvim",
    cmd = { "AdvancedGitSearch" },
    config = function()
        require("advanced_git_search.fzf").setup{
            -- Insert Config here
        }
    end,
    dependencies = {
        -- Insert Dependencies here
    },
}
