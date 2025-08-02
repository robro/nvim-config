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

vim.api.nvim_create_autocmd('BufWritePost', {
  desc = 'Format Godot script on save',
  group = vim.api.nvim_create_augroup('godot-format', { clear = true }),
  callback = function()
    if vim.bo.filetype == 'gdscript' then
      vim.cmd [[!gdformat %]]
    end
  end,
})
