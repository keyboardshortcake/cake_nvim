vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd("quit")
  end,
})

-- vim.api.nvim_create_autocmd({ "TextYankPost" }, {
--   callback = function()
--     vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
--   end,
-- })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    vim.lsp.codelens.refresh()
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd("hi link illuminatedWord LspReferenceText")
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
  local line_count = vim.api.nvim_buf_line_count(0)
    if line_count >= 5000 then
      vim.cmd("IlluminatePauseBuf")
    end
  end,
})

-- vim.api.nvim_create_autocmd("TextYankPost", "*", [[
--     if v:event.operator == 'y' and v:event.regname == '+' then
--         vim.fn.execute('OSCYankRegister +')
--     end
-- ]])

-- vim.api.nvim_create_autocmd({ "TextYankPost"}, {
--   callback = function()
--     vim.cmd([[
--       if v:event.operator == 'y' and v:event.regname == '+' then
--           vim.fn.execute('OSCYankRegister +')
--       end
--     ]])
--   end,
-- })


-- force shift tab to act right
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-d>', { noremap = true, silent = true })
local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- GROUPS:
local disable_node_modules_eslint_group =
	ag("DisableNodeModulesEslint", { clear = true })

-- AUTO-COMMANDS:
au({ "BufNewFile", "BufRead" }, {
	pattern = { "**/node_modules/**", "node_modules", "/node_modules/*" },
	callback = function()
		vim.diagnostic.disable(0)
	end,
	group = disable_node_modules_eslint_group,
})

-- vim.api.nvim_exec([[
--   autocmd BufReadPost * nested
--         \ if not vim.b.reload_dos and not vim.bo.binary and vim.bo.fileformat == 'unix' and vim.fn.search('\r$', 'nc') > 0 then
--         \   vim.b.reload_dos = 1
--         \   execute 'edit ++ff=dos'
--         \ end
-- ]], false)

