local default = 'dracula'

local colors = {
  tokyonight = 'folke/tokyonight.nvim',
  godotcolour = 'mocte4/godotcolour-vim',
  dracula = 'dracula/vim',
}

local color_specs = {}

for name, url in pairs(colors) do
  table.insert(color_specs, {
    url,
    lazy = false,
    priority = 1000,
    config = function()
      if name == default then
        vim.cmd.colorscheme(name)
      end
    end,
  })
end

return color_specs
