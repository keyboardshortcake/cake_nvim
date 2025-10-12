-- i don't use netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- configs -- this should be loaded before lazy.nvim
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Add the syntax directory to the runtimepath
-- vim.o.runtimepath = vim.o.runtimepath .. ',' .. vim.fn.stdpath('config') .. '/syntax'

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- autocmd BufNewFile,BufRead *.blurb set filetype=blurb
-- lsp
-- vim.lsp.enable('foo')
vim.lsp.enable('copilot')
-- vim.lsp.set_log_level("info")

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

-- Set colorscheme after options
vim.cmd('colorscheme dayfox')
-- vim.cmd('colorscheme habamax')
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
        vim.cmd('setlocal number! relativenumber!') -- Hide the gutter for this buffer
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

-- function ViewNvimLog()
--     -- Create a new buffer for the log viewer
--     local buf = vim.api.nvim_create_buf(false, true)
--
--     -- Set buffer options
--     vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
--     vim.api.nvim_buf_set_option(buf, 'swapfile', false)
--     vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
--
--     -- Get log directory path
--     local log_dir = vim.fn.stdpath('log')
--     local log_file = log_dir .. '/log'
--
--     -- Check if log file exists
--     if vim.fn.filereadable(log_file) == 1 then
--         -- Read log file content
--         local log_content = vim.fn.readfile(log_file)
--
--         -- Set buffer content
--         vim.api.nvim_buf_set_lines(buf, 0, -1, false, log_content)
--
--         -- Open in a new split
--         vim.cmd('split')
--         vim.api.nvim_win_set_buf(0, buf)
--
--         -- Set buffer name
--         vim.api.nvim_buf_set_name(buf, 'Neovim Log')
--
--         -- Set filetype for syntax highlighting
--         vim.api.nvim_buf_set_option(buf, 'filetype', 'log')
--
--         -- Make buffer read-only
--         vim.api.nvim_buf_set_option(buf, 'readonly', true)
--         vim.api.nvim_buf_set_option(buf, 'modifiable', false)
--
--         -- Go to the end of the file to see latest entries
--         vim.cmd('normal! G')
--
--         -- Add keymap to refresh the log
--         vim.api.nvim_buf_set_keymap(buf, 'n', 'r', '<cmd>lua RefreshNvimLog()<CR>', { noremap = true, silent = true })
--
--         print("Neovim log opened. Press 'r' to refresh, 'q' to close.")
--     else
--         -- If no log file, show messages instead
--         vim.cmd('messages')
--         print("No log file found at " .. log_file .. ". Showing :messages instead.")
--     end
-- end
--
-- function RefreshNvimLog()
--     local current_buf = vim.api.nvim_get_current_buf()
--     local log_dir = vim.fn.stdpath('log')
--     local log_file = log_dir .. '/log'
--
--     if vim.fn.filereadable(log_file) == 1 then
--         -- Make buffer modifiable temporarily
--         vim.api.nvim_buf_set_option(current_buf, 'modifiable', true)
--
--         -- Clear buffer and reload content
--         local log_content = vim.fn.readfile(log_file)
--         vim.api.nvim_buf_set_lines(current_buf, 0, -1, false, log_content)
--
--         -- Make buffer read-only again
--         vim.api.nvim_buf_set_option(current_buf, 'modifiable', false)
--
--         -- Go to the end of the file
--         vim.cmd('normal! G')
--
--         print("Log refreshed")
--     else
--         print("Log file not found")
--     end
-- end
