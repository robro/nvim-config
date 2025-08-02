-- ===============================================================================================
-- [[ Basic Keymaps ]]
-- ===============================================================================================
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<A-left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<A-right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<A-down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<A-up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Custom keymaps
vim.keymap.set('n', '<leader>sc', '<Cmd>Telescope gdscript-extended-lsp class<CR>', { desc = '[S]earch Godot [C]lasses' })
vim.keymap.set('n', '<leader>gf', '<Cmd>!gdformat %<CR>', { desc = '[G]odot [F]ormat buffer' })
vim.keymap.set('n', '<leader>gl', '<Cmd>!gdlint %<CR>', { desc = '[G]odot [L]int buffer' })
