vim.opt.confirm = true
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
-- mmkay this here breaks plugin installs for some reason
-- vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.breakindent = true                      -- umm, aligns the indents
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.laststatus = 2                          -- only the last window will always have a status line
vim.opt.showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
vim.opt.ruler = false                           -- hide the line and column number of the cursor position
vim.opt.numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
vim.opt.signcolumn =
"yes"                                           -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = true                             -- display lines as one long line
vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.fillchars.eob = " "                     -- show empty lines at the end of a buffer as ` ` {default `~`}
vim.opt.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.whichwrap:append("<,>,[,],h,l")         -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.iskeyword:append("-,_")                 -- treats words with `-`, or `_` as single words
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
vim.opt.linebreak = true
vim.opt.relativenumber = true
vim.opt.modifiable = true             -- trying to fix this huge error that pops up everytime i install a plugin
vim.g.undotree_SetFocusWhenToggle = 1 -- focus undotree when i toggle it open
-- vim.o.eol = "unix"                                        -- Ensure that files are saved with a newline at the end. (set eol=unix)
vim.opt.fixeol = false                -- Don't try to fix the EOL for files. Just let them remain however I found them. Equivalent to `set nofixeol` in Vimscript
vim.o.fileformats =
"unix,dos,mac"                        -- because the d.ts file for angular are showing up with ^M characters all throughouts
vim.opt.mousemodel = "extend"         -- This kills the right click menu
-- this stuff is for the folding plugin called "ufo"
-- vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.g.editorconfig = false -- Having some random editorconfig dictacting how my file gets formatted is pretty annoying. Turning it off.

-- copilot stuff

-- -- disable by default
-- vim.g.copilot_filetypes = {
--     ["*"] = false,
-- }
-- -- explicitly request for copilot suggestions on Ctrl-Enter
-- vim.keymap.set('i', '<C-CR>', '<Plug>(copilot-suggest)')


-- /end ufo stuff
-- vim.lsp.inlay_hint.enable(0, true)

-- vim.opt.completeopt = {'menu', 'menuone', 'noselect'} -- for nvim-cmp? per https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
-- 						*default-mouse* *disable-mouse*
-- By default the mouse is enabled, and <RightMouse> opens a |popup-menu| with
-- standard actions ("Cut", "Copy", "Paste", …). Mouse is NOT enabled in
-- |command-mode| or the |more-prompt|, so you can temporarily disable it just by
-- typing ":".
--
-- If you don't like this you can disable the mouse in your |config| using any of
-- the following:
-- - Disable mouse completely by unsetting the 'mouse' option: >
--   set mouse=
-- - Pressing <RightMouse> extends selection instead of showing popup-menu: >
--   set mousemodel=extend
-- - Pressing <A-LeftMouse> releases mouse until the cursor moves:  >
--   nnoremap <A-LeftMouse> <Cmd>
--     \ set mouse=<Bar>
--     \ echo 'mouse OFF until next cursor-move'<Bar>
--     \ autocmd CursorMoved * ++once set mouse&<Bar>
--     \ echo 'mouse ON'<CR>
--

-- could also set settings with vim.cmd like this vim.cmd("set undofile = true")

vim.g.bookmark_auto_close = 1
vim.g.bookmark_display_annotation = 1

vim.g.copilot_filetypes = {
    gitcommit = true,
    markdown = true,
    text = true,
    scratch = true,
    toggledo = true,
    -- xml = false,
}

-- let g:better_whitespace_filetypes_blacklist = ['diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive', 'snacks', 'vimwiki', 'snacks_dashboard']
-- vim.g.better_whitespace_filetypes_blacklist = ['diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive', 'snacks', 'vimwiki', 'snacks_dashboard']

vim.g.better_whitespace_filetypes_blacklist = {
    'snacks',
    'diff',
    'git',
    'gitcommit',
    'unite',
    'qf',
    'help',
    'markdown',
    'fugitive',
    'snacks',
    'vimwiki',
    'snacks_dashboard',
}

-- vim.g.better_whitespace_filetypes_blacklist = {
--     "terminal",
--     "nofile",
--     "markdown",
--     "help",
--     "startify",
--     "dashboard",
--     "packer",
--     "neogitstatus",
--     "NvimTree",
--     "Trouble",
-- }

-- vim.g.copilot_filetypes = {
--     gitcommit = 1,
-- }

-- vim.g.copilot_filetypes = {
--     \ gitcommit: v:true,
-- }

-- let g:copilot_filetypes = {
--       'xml': v:false,
-- }

-- let g:bookmark_auto_close = 1

-- Bullets.vim
-- vim.g:bullets_enabled_file_types = [
--     \ 'markdown',
--     \ 'text',
--     \ 'gitcommit',
--     \ 'scratch'
--     \]

-- vim.api.nvim_set_var('better_whitespace_filetypes_blacklist', {
--     'diff',
--     'git',
--     'gitcommit',
--     'unite',
--     'qf',
--     'help',
--     'markdown',
--     'fugitive',
--     'snacks',
--     'vimwiki',
--     'snacks_dashboard'
-- })

vim.api.nvim_set_var('bullets_enabled_file_types', {
    'markdown',
    'text',
    'gitcommit',
    'scratch',
    'toggledo',
})

vim.api.nvim_set_var('bullets_custom_mappings', {
    { "imap",     "<cr>",      "<Plug>(bullets-newline)" },
    { "inoremap", "<C-cr>",    "<cr>" },
    { "nmap",     "o",         "<Plug>(bullets-newline)" },
    { "vmap",     "gN",        "<Plug>(bullets-renumber)" },
    { "nmap",     "gN",        "<Plug>(bullets-renumber)" },
    { "nmap",     "<leader>x", "<Plug>(bullets-toggle-checkbox)" },
    -- { "imap",     "<S-t>",     "<Plug>(bullets-demote)" },
    -- { "imap",     "<C-t>",     "<Plug>(bullets-demote)" },
    -- { "imap",     "<D-t>",     "<Plug>(bullets-demote)" },
    { "imap",     "<Tab>",     "<Plug>(bullets-demote)" },
    { "nmap",     "<Tab>",     "<Plug>(bullets-demote)" },
    -- { "imap",     "<S-Tab>",     "<Plug>(bullets-demote)" },
    { "nmap",     ">>",        "<Plug>(bullets-demote)" },
    { "vmap",     ">",         "<Plug>(bullets-demote)" },
    { "imap",     "<C-d>",     "<Plug>(bullets-promote)" },
    { "imap",     "<S-Tab>",   "<Plug>(bullets-promote)" },
    { "nmap",     "<S-Tab>",   "<Plug>(bullets-promote)" },
    { "nmap",     "<<",        "<Plug>(bullets-promote)" },
    { "vmap",     "<",         "<Plug>(bullets-promote)" }
})
