return {
  -- Create a function with a type:
  -- func some_name() -> SomeType:
  --  ...
  -- TODO: Make it scope aware with treesitter for anonymous functions
  s(
    'func',
    fmt(
      [[
func {}({}) -> {}:
	{}


]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
      }
    )
  ),
}
