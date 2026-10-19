return {
  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        gdscript = { 'gdlint' },
        -- python = { 'pylint' },
        -- markdown = { 'vale' },
        -- rst = { 'vale' },
        -- text = { 'vale' },
      }

      lint.linters.pylint.cmd = 'python2'
      lint.linters.pylint.args = { '-m', 'pylint', '-f', 'json' }
      lint.linters.pylint.stdin = false

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
