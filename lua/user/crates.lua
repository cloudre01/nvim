local M = {
  "saecki/crates.nvim",
  tag = "v0.3.0",
  lazy = true,
  dependencies = {
    {"nvim-lua/plenary.nvim", opt = true},
  },
  config = function()
    require('crates').setup()
  end,
}

return M
