require "nvchad.options"

local custom = {
  g = {},
  opt = {
    tabstop = 4,
    shiftwidth = 4,
    smarttab = true,
    wrap = false,
    modifiable = true,
  },
}

for i, opts in pairs(custom) do
  for k, v in pairs(opts) do
    vim[i][k] = v
  end
end
