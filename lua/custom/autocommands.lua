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

vim.api.nvim_create_autocmd('DirChanged', {
  desc = 'Start the godot server if we change to a godot directory',
  callback = function()
    require('godot-server').start_server()
  end,
})
