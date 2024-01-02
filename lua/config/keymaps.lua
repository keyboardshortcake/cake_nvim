-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- this lets me see my diagnostics errors/etc or "virtual_text" in a popup as well
-- ref: https://www.reddit.com/r/neovim/comments/og1cdv/neovim_lsp_how_do_you_get_diagnostic_mesages_to/
vim.api.nvim_set_keymap('n', '<space>y', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tmux navigation
-- -- -- Set the variable in Lua
-- vim.g.tmux_navigator_no_mappings = 1
--
-- -- Define key mappings using Lua
-- keymap('n', '<C-h>', ':<C-U>TmuxNavigateLeft<CR>', { noremap = true, silent = true })
-- keymap('n', '<C-j>', ':<C-U>TmuxNavigateDown<CR>', { noremap = true, silent = true })
-- keymap('n', '<C-k>', ':<C-U>TmuxNavigateUp<CR>', { noremap = true, silent = true })
-- keymap('n', '<C-l>', ':<C-U>TmuxNavigateRight<CR>', { noremap = true, silent = true })
-- keymap('n', '<silent>{Previous-Mapping}', ':<C-U>TmuxNavigatePrevious<CR>', { noremap = true, silent = true })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>cc", ":Telescope keymaps<CR>", opts)
keymap("n", "<leader>fl", ":Telescope lazy<CR>", opts)
keymap("n", "<leader>fn", ":Telescope node_modules list<CR>", opts)


-- preview justthis stuff1k
keymap("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
keymap("n", "q", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)

-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- keymap("n", "<leader>k", ":NvimTreeFocus<CR>", opts)

--NeoTree or neo-tree or neo tree
-- keymap("n", "<leader>e", ":NeoTreeRevealToggle<CR>", opts)
keymap("n", "<leader>e", ":Neotree reveal toggle<CR>", opts)
keymap("n", "<leader>k", ":Neotree focus<CR>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Navigate buffers
keymap("n", "<leader>j", "<C-^>", opts) -- go to previous open file (also called the 'alternate-file')
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>q", "<cmd>:Bdelete<cr>", opts) -- this one doesn't work properly, works with lowercase :bdelete ... sort of, look into it
-- :Bdelete is a more gentle buffer deletion command that keeps the buffer in memory if it's open in other windows, while :Bdelete! forcefully removes the buffer from memory, potentially closing other windows displaying the same buffer.
-- keymap("n", "<leader>q", "<cmd>Bdelete!<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- To search git commits! But ... I think there's another option called
-- search_log_content_files, not sure what the difference is yet
keymap("n", "<leader>tc", ":Telescope advanced_git_search search_log_content_file<cr>", opts)
keymap("n", "<leader>tl", "V:AdvancedGitSearch diff_commit_line<CR>", opts)
-- keymap("n", "<leader>lv", ":Telescope advanced_git_search diff_commit_line <cr>", opts)
-- keymap("v", "<leader>tl", ':AdvancedGitSearch diff_commit_line<CR>', opts)

-- Open lazygit
keymap("n", "<leader>gg", "<cmd>:LazyGit<cr>", opts)

-- toggle gitblame
keymap("n", "<leader>GB", "<cmd>:GitBlameToggle<cr>", opts)


-- LSPSAGAAAAAAA (lspsaga)
-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
-- keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
-- keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
-- keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
-- keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
-- keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
-- keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
-- keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
-- keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
-- keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
-- keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
-- keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
-- keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
-- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
-- keymap("n", "[E", function()
--   require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end)
-- keymap("n", "]E", function()
--   require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end)

-- Toggle outline
-- keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
-- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
-- keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
-- keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
-- keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
-- keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
--

-- this is for oil.nvim
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--
keymap('n', '<leader>u', vim.cmd.UndotreeToggle)

-- this stuff is in the nightly version of nvim as of today
keymap("n", '<leader>ie', "<cmd>lua vim.lsp.inlay_hint.enable(0, true)<CR>")
keymap("n", '<leader>id', "<cmd>lua vim.lsp.inlay_hint.enable(0, false)<CR>")

