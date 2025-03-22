local M = {}

function M.explain_selection()
  local start_line, start_col = unpack(vim.api.nvim_buf_get_mark(0, '<'))
  local end_line, end_col = unpack(vim.api.nvim_buf_get_mark(0, '>'))
  
  -- Adjust for 0-indexed API
  start_line = start_line - 1
  end_line = end_line - 1
  
  -- Get selected text
  local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line + 1, false)
  if #lines == 0 then return end
  
  -- Adjust columns for first and last line
  if #lines == 1 then
    lines[1] = string.sub(lines[1], start_col + 1, end_col + 1)
  else
    lines[1] = string.sub(lines[1], start_col + 1)
    lines[#lines] = string.sub(lines[#lines], 1, end_col + 1)
  end
  
  local code = table.concat(lines, "\n")
  
  -- Create floating window for explanation
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.min(120, vim.o.columns - 10)
  local height = math.min(20, vim.o.lines - 10)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = (vim.o.lines - height) / 2,
    col = (vim.o.columns - width) / 2,
    style = 'minimal',
    border = 'rounded'
  })
  
  -- Set buffer options
  -- vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  -- vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')
  
  -- Add loading message
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {"Loading explanation from GitHub Copilot..."})
  
  -- Run gh copilot explain in the background
  vim.fn.jobstart('gh copilot explain "' .. code:gsub('"', '\\"') .. '"', {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(buf, 0, -1, false, data)
        end)
      end
    end,
    on_stderr = function(_, data)
      if data and #data > 1 then
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(buf, 0, -1, false, {"Error: " .. table.concat(data, "\n")})
        end)
      end
    end
  })
end

return M
