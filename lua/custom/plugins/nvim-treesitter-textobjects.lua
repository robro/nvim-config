return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  init = function()
    vim.g.no_plugin_maps = true
  end,
  config = function()
    require('nvim-treesitter-textobjects').setup {
      select = {
        lookahead = true,
        include_surrounding_whitespace = true,
      },

      move = {
        set_jumps = true, -- whether to set jumps in the jumplist
      },
    }

    -- keymaps

    -- select
    vim.keymap.set({ 'x', 'o' }, 'aa', function()
      require('nvim-treesitter-textobjects.select').select_textobject('@parameter.outer', 'textobjects')
    end, { desc = 'argument/parameter' })
    vim.keymap.set({ 'x', 'o' }, 'ia', function()
      require('nvim-treesitter-textobjects.select').select_textobject('@parameter.inner', 'textobjects')
    end, { desc = 'inner argument/parameter' })

    vim.keymap.set({ 'x', 'o' }, 'ai', function()
      require('nvim-treesitter-textobjects.select').select_textobject('@conditional.outer', 'textobjects')
    end, { desc = 'if statement' })
    vim.keymap.set({ 'x', 'o' }, 'ii', function()
      require('nvim-treesitter-textobjects.select').select_textobject('@conditional.inner', 'textobjects')
    end, { desc = 'inner if statement' })

    vim.keymap.set({ 'x', 'o' }, 'al', function()
      require('nvim-treesitter-textobjects.select').select_textobject('@loop.outer', 'textobjects')
    end, { desc = 'loop' })
    vim.keymap.set({ 'x', 'o' }, 'il', function()
      require('nvim-treesitter-textobjects.select').select_textobject('@loop.inner', 'textobjects')
    end, { desc = 'inner loop' })

    vim.keymap.set({ 'x', 'o' }, 'am', function()
      require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
    end, { desc = 'method/function' })
    vim.keymap.set({ 'x', 'o' }, 'im', function()
      require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
    end, { desc = 'inner method/function' })

    vim.keymap.set({ 'x', 'o' }, 'ac', function()
      require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
    end, { desc = 'class' })
    vim.keymap.set({ 'x', 'o' }, 'ic', function()
      require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
    end, { desc = 'inner class' })

    -- swap
    vim.keymap.set('n', '<leader>na', function()
      require('nvim-treesitter-textobjects.swap').swap_next '@parameter.inner'
    end, { desc = 'argument/parameter' })
    vim.keymap.set('n', '<leader>nm', function()
      require('nvim-treesitter-textobjects.swap').swap_next '@function.outer'
    end, { desc = 'method/function' })

    vim.keymap.set('n', '<leader>pa', function()
      require('nvim-treesitter-textobjects.swap').swap_previous '@parameter.inner'
    end, { desc = 'argument/parameter' })
    vim.keymap.set('n', '<leader>pm', function()
      require('nvim-treesitter-textobjects.swap').swap_previous '@function.outer'
    end, { desc = 'method/function' })

    -- move
    -- next start
    vim.keymap.set({ 'n', 'x', 'o' }, ']c', function()
      require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
    end, { desc = 'next class start' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']i', function()
      require('nvim-treesitter-textobjects.move').goto_next_start('@conditional.outer', 'textobjects')
    end, { desc = 'next if statement start' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']l', function()
      require('nvim-treesitter-textobjects.move').goto_next_start('@loop.outer', 'textobjects')
    end, { desc = 'next loop start' })

    -- next end
    vim.keymap.set({ 'n', 'x', 'o' }, ']C', function()
      require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
    end, { desc = 'next class end' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']I', function()
      require('nvim-treesitter-textobjects.move').goto_next_end('@conditional.outer', 'textobjects')
    end, { desc = 'next if statement end' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']L', function()
      require('nvim-treesitter-textobjects.move').goto_next_end('@loop.outer', 'textobjects')
    end, { desc = 'next loop end' })

    -- prev start
    vim.keymap.set({ 'n', 'x', 'o' }, '[c', function()
      require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
    end, { desc = 'previous class start' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[i', function()
      require('nvim-treesitter-textobjects.move').goto_previous_start('@conditional.outer', 'textobjects')
    end, { desc = 'previous if statement start' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[l', function()
      require('nvim-treesitter-textobjects.move').goto_previous_start('@loop.outer', 'textobjects')
    end, { desc = 'previous loop start' })

    -- previous end
    vim.keymap.set({ 'n', 'x', 'o' }, '[C', function()
      require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
    end, { desc = 'previous class end' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[I', function()
      require('nvim-treesitter-textobjects.move').goto_previous_end('@conditional.outer', 'textobjects')
    end, { desc = 'previous if statement end' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[L', function()
      require('nvim-treesitter-textobjects.move').goto_previous_end('@loop.outer', 'textobjects')
    end, { desc = 'previous loop end' })

    local ts_repeat_move = require 'nvim-treesitter-textobjects.repeatable_move'

    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
  end,
}
