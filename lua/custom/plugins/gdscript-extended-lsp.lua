return {
  'teatek/gdscript-extended-lsp.nvim',
  lazy = false,
  opts = {
    doc_file_extension = '.txt', -- Documentation file extension (can allow a better search in buffers list with telescope)
    view_type = 'vsplit', -- Options : "current", "split", "vsplit", "tab", "floating"
    split_side = false, -- (For split and vsplit only) Open on the right or top on false and on the left or bottom on true
    keymaps = {
      declaration = 'gd', -- Keymap to go to definition
      close = { 'q', '<Esc>' }, -- Keymap for closing the documentation
    },
    floating_win_size = 0.8, -- Floating window size
    picker = 'telescope', -- Options : "telescope", "snacks"
  },
  keys = {
    {
      '<leader>sc',
      '<cmd>Telescope gdscript-extended-lsp class<cr>',
      desc = '[S]earch Godot [C]lasses',
    },
  },
}
