local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim"
  }
}

function M.config()
  require("harpoon").setup()
end

return M
