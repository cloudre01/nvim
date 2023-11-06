local M = {
  "nvim-pack/nvim-spectre",
  commit = "696cff781a4a7ecc91549736835e2acbd00fe859",
  dependencies = {
    "nvim-lua/plenary.nvim"
  }
}

function M.config()
  require("spectre").setup()
end

return M
