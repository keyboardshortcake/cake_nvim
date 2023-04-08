-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

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


-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- keymap("n", "<leader>k", ":NvimTreeFocus<CR>", opts)

--NeoTree or neo-tree or neo tree
keymap("n", "<leader>e", ":NeoTreeRevealToggle<CR>", opts)
-- keymap("n", "<leader>k", ":NeoTreeFocusToggle<CR>", opts)
keymap("n", "<leader>k", ":NeoTreeFocus<CR>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)

-- Normal vim shortcuts
keymap("n", "<leader>q", "<cmd>:Bdelete<cr>", opts) -- this one doesn't work properly, works with lowercase :bdelete ... sort of, look into it
-- go to previous open file (also called the 'alternate-file')
keymap("n", "<leader>j", "<C-^>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

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
keymap("n", "<leader>fc", ":Telescope advanced_git_search search_log_content_file<cr>", opts)

-- Open lazygit
keymap("n", "<leader>gg", "<cmd>:LazyGit<cr>", opts)
