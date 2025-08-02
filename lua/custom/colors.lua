-- Use different colorschemes for different projects
return {
  {
    -- Default to tokyonight
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }

      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  {
    -- Use godotcolour if in a godot project
    'mocte4/godotcolour-vim',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      local project_file = vim.fs.root(0, '/project.godot')
      if project_file then
        vim.cmd.colorscheme 'godotcolour'
      end
    end,
  },
}
