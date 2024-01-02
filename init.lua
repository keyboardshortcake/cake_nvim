-- configs -- this should be loaded before lazy.nvim
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- require("plugins.telescope")
require("lazy").setup("plugins")
--     dependencies = {
--         { 'nvim-lua/plenary.nvim' },
--         -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }, -- don't need, just for fun
--         -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
--         { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
--         { "aaronhallaert/advanced-git-search.nvim" }, -- don't need
--         "tpope/vim-fugitive",                         -- advanced_git_search uses this
--         {
--             "nvim-telescope/telescope-live-grep-args.nvim",
--             -- This will not install any breaking changes.
--             -- For major updates, this must be adjusted manually.
--             version = "^1.0.0",
--         },
--     },
-- enable inlay hints by default (v10 nvim)
-- vim.lsp.inlay_hint.enable(0, true)
