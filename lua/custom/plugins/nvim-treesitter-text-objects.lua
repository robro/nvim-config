return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  lazy = true,
  config = function()
    require('nvim-treesitter.configs').setup {
      textobjects = {

        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of an [a]rgument' },
            ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of an [a]rgument' },

            ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of an [i]f statement' },
            ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of an [i]f statement' },

            ['al'] = { query = '@loop.outer', desc = 'Select outer part of a [l]oop' },
            ['il'] = { query = '@loop.inner', desc = 'Select inner part of a [l]oop' },

            ['am'] = { query = '@function.outer', desc = 'Select outer part of a [m]ethod definition' },
            ['im'] = { query = '@function.inner', desc = 'Select inner part of a [m]ethod definition' },

            ['ac'] = { query = '@class.outer', desc = 'Select outer part of a [c]lass' },
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a [c]lass' },
          },
        },

        swap = {
          enable = true,
          swap_next = {
            ['<leader>na'] = '@parameter.inner', -- swap parameters/argument with next
            ['<leader>nm'] = '@function.outer', -- swap function with next
          },
          swap_previous = {
            ['<leader>pa'] = '@parameter.inner', -- swap parameters/argument with prev
            ['<leader>pm'] = '@function.outer', -- swap function with previous
          },
        },

        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = { query = '@function.outer', desc = 'Next method/function def start' },
            [']c'] = { query = '@class.outer', desc = 'Next class start' },
            [']i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
            [']l'] = { query = '@loop.outer', desc = 'Next loop start' },
          },
          goto_next_end = {
            [']M'] = { query = '@function.outer', desc = 'Next method/function def end' },
            [']C'] = { query = '@class.outer', desc = 'Next class end' },
            [']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
            [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
          },
          goto_previous_start = {
            ['[m'] = { query = '@function.outer', desc = 'Prev method/function def start' },
            ['[c'] = { query = '@class.outer', desc = 'Prev class start' },
            ['[i'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
            ['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
          },
          goto_previous_end = {
            ['[M'] = { query = '@function.outer', desc = 'Prev method/function def end' },
            ['[C'] = { query = '@class.outer', desc = 'Prev class end' },
            ['[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
            ['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
          },
        },
      },
    }

    local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

    -- vim way: ; goes to the direction you were moving.
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)
  end,
}
