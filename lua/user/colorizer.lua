local M = {
  "NvChad/nvim-colorizer.lua",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
}

function M.config()
  local colorizer = require('colorizer') 

  colorizer.setup {}
end

return M
