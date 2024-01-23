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
-- disabling to see if I notice it's not there. maybe i don't need it anymore?
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

au({ "BufNewFile", "BufFilePre", "BufRead" }, {
    pattern = {
        "*.md", ".markdown",
    },
    callback = function()
        vim.bo.filetype = 'markdown'
        vim.bo.syntax = "markdown"
    end
})

local function checkboxing(mark)
    return function()
        local line = vim.fn.getline('.')
        local insert_checkbox = '\\<'
        local insert_checkbox_prefix = ''
        local insert_checkbox_suffix = ' '

        if vim.fn.match(line, '\\[\\(.\\)\\]') ~= -1 then
            line = vim.fn.substitute(line, '\\[\\(.\\)\\]', '[' .. mark .. ']', '')
        else
            if insert_checkbox ~= '' then
                line = vim.fn.substitute(line, insert_checkbox,
                    insert_checkbox_prefix .. '[' .. mark .. ']' .. insert_checkbox_suffix, '')
            end
        end

        vim.fn.setline('.', line)
    end
end

local function togglebox()
    local line = vim.fn.getline('.')
    local insert_checkbox = '\\<'
    local insert_checkbox_prefix = ''
    local insert_checkbox_suffix = ' '
    local space = ' '
    local check = 'x'

    -- Case 1: If the checkbox is [x], replace it with [ ]
    if vim.fn.match(line, '\\[\\(' .. check .. '\\)\\]') ~= -1 then
        line = vim.fn.substitute(line, '\\[\\(' .. check .. '\\)\\]', '[' .. space .. ']', '')
        -- Case 2: If the checkbox is [any character other than x], replace it with [x]
    elseif vim.fn.match(line, '\\[\\([^' .. check .. ']\\)\\]') ~= -1 then
        line = vim.fn.substitute(line, '\\[\\([^' .. check .. ']\\)\\]', '[' .. check .. ']', '')
        -- Case 3: If there's no checkbox, insert a new one
    else
        line = vim.fn.substitute(line, insert_checkbox,
            insert_checkbox_prefix .. '[' .. space .. ']' .. insert_checkbox_suffix, '')
    end

    vim.fn.setline('.', line)
end

local focusBox = checkboxing('*')
vim.api.nvim_create_user_command('FocusBox', focusBox, {})
vim.api.nvim_create_user_command('CheckboxToggle', togglebox, {})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
    pattern = { "*toggle.do" },
    callback = function()
        local opts = {
            noremap = true,
            silent = true,
        }
        vim.bo.filetype = 'toggledo'
        -- vim.diagnostic.disable(0)
        vim.api.nvim_buf_set_keymap(0, 'n', '<leader>l', ':FocusBox<CR>', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', '<leader>;', ':CheckboxToggle<CR>', opts)
    end,
})
