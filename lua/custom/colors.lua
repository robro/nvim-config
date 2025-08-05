local default = 'dracula'

local colors = {
  tokyonight = { url = 'folke/tokyonight.nvim', default = 'tokyonight-moon' },
  godotcolour = { url = 'mocte4/godotcolour-vim', default = 'godotcolour' },
  dracula = { url = 'dracula/vim', default = 'dracula' },
  rosepine = { url = 'rose-pine/neovim', default = 'rose-pine' },
}

local color_specs = {}

for id, color in pairs(colors) do
  table.insert(color_specs, {
    color.url,
    lazy = false,
    priority = 1000,
    config = function()
      if id == default then
        vim.cmd.colorscheme(color.default)
      end
    end,
  })
end

return color_specs
