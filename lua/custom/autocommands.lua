-- ===============================================================================================
-- [[ Basic Autocommands ]]
-- ===============================================================================================
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Set colorcolumn based on filetype',
  group = vim.api.nvim_create_augroup('set-colorcolumn', { clear = true }),
  callback = function()
    local ft_columns = {
      gdscript = 100,
      python = 88,
    }
    if ft_columns[vim.bo.filetype] ~= nil then
      vim.o.colorcolumn = tostring(ft_columns[vim.bo.filetype] + 1)
    else
      vim.o.colorcolumn = ''
    end
  end,
})
