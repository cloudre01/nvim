local M = {
  "windwp/nvim-ts-autotag",
  dependencies = "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = "VeryLazy",
}

function M.config()
  require("nvim-ts-autotag").setup {}
end

return M
