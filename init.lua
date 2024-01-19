-- configs -- this should be loaded before lazy.nvim
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Add the syntax directory to the runtimepath
vim.o.runtimepath = vim.o.runtimepath .. ',' .. vim.fn.stdpath('config') .. '/syntax'

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- autocmd BufNewFile,BufRead *.blurb set filetype=blurb

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

require("lazy").setup("plugins", {
    -- defaults = {
    --     lazy = true
    -- }
})

-- Place the ToggleDo function after lazy-loaded plugins are set up
vim.api.nvim_set_keymap('n', '<leader>td', ':lua ToggleDo()<CR>', { noremap = true, silent = true })

function ToggleDo()
    local toggle_do_pattern = "toggle%.do$"
    local toggledo_bufnr = 0

    -- Check if the toggle buffer is already open
    for _, bufnr in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
        local bufname = vim.fn.bufname(bufnr.bufnr)
        if bufname:match(toggle_do_pattern) then
            toggledo_bufnr = bufnr.bufnr
            break
        end
    end

    if toggledo_bufnr == 0 then
        -- If buffer is not open, open it in a new vertical split from the left
        vim.cmd('vsplit | wincmd H')
        vim.cmd('edit ~/.toggle.do')
        vim.cmd('vertical resize 50')
        vim.cmd('setlocal number! relativenumber!')  -- Hide the gutter for this buffer
        -- vim.cmd('setlocal winwidth=30')
        -- Set up automatic saving without needing :w
        vim.fn.execute("augroup AutoSaveToggleDo")
        vim.fn.execute("autocmd!")
        vim.fn.execute("autocmd TextChanged,TextChangedI <buffer> silent write")
        vim.fn.execute("augroup END")
    else
        -- This checks if the buffer is the only one before deleting it.
        if vim.fn.buflisted(vim.fn.bufnr('%')) == 1 and vim.fn.bufnr('$') == vim.fn.bufnr('%') then
            vim.cmd('hide | bd! ' .. toggledo_bufnr)
        else
            vim.cmd('bd! ' .. toggledo_bufnr)
        end
    end
end
