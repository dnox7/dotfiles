---@type NvPluginSpec
return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  event = "LspAttach",
  opts = {
    code_action = {
      num_shortcut = false,
    },

    outline = {
      win_width = 40,
      layout = "float",
      max_height = 0.7,
      left_width = 0.3,
    },
  },
}
