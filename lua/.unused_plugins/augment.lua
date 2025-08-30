-- return {
-- 	-- Your other plugins here
--
-- 	"augmentcode/augment.vim",
-- }

return {
	"augmentcode/augment.vim",
	config = function()
		-- Set workspace folders for Augment to understand your codebase
		vim.g.augment_workspace_folders = { "~/.config/nvim/" }

		-- Additional configuration options
		vim.g.augment_auto_suggestions = false -- Enable/disable auto suggestions
		vim.g.augment_suggestion_delay = 300 -- Delay before showing suggestions (ms)

		-- Custom keymaps for Augment functionality
		vim.keymap.set("n", "<leader>ac", ":Augment chat<CR>", { noremap = true, silent = true })
		vim.keymap.set("v", "<leader>ac", ":Augment chat<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>an", ":Augment chat-new<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>at", ":Augment chat-toggle<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>as", ":Augment status<CR>", { noremap = true, silent = true })
	end,
}

