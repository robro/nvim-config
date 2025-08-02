--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--  NOTE: Must happen before plugins are loaded (otherwise they will not use nerd fonts)
vim.g.have_nerd_font = true

require 'custom.options'
require 'custom.keymaps'
require 'custom.autocommands'
require 'custom.lazy'

require('luasnip.loaders.from_lua').load {
  paths = { '~/.config/nvim/lua/snippets/' },
}
