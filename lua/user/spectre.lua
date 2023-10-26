local M = {
  "nvim-pack/nvim-spectre",
  dependencies = {
   "nvim-lua/plenary.nvim" 
  }
}

function M.config()
  require("spectre").setup()
end

return M
