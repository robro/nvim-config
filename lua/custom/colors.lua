local default = 'dracula'

local colors = {
  tokyonight = 'folke/tokyonight.nvim',
  godotcolour = 'mocte4/godotcolour-vim',
  dracula = 'dracula/vim',
}

local color_specs = {}

local function ternary(c, t, f)
  if c then
    return t
  else
    return f
  end
end

for name, url in pairs(colors) do
  table.insert(color_specs, {
    url,
    lazy = ternary(name == default, false, true),
    priority = ternary(name == default, 1000, 50),
    config = function()
      if name == default then
        vim.cmd.colorscheme(name)
      end
    end,
  })
end

return color_specs
