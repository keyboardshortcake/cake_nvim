-- I don't think this plugin will work on a sandbox, since it has no browser or whatever
return {
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = {
            "markdown" } end,
            ft = { "markdown" },
        },
}
