local M = {
  "simrat39/rust-tools.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  }
}


function M.config()
  require("rust-tools").setup()
end

return M
