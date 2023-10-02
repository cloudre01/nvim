local M = {
  "NvChad/nvim-colorizer.lua",
  -- lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  event = { "BufReadPost", "BufNewfile" }
}

function M.config()
  local colorizer = require('colorizer')

  colorizer.setup {
    filetypes = {
      '*',

      -- Ecluded filetypes.
      '!lazy', -- Commit hashes get highlighted sometimes.
    },
    user_default_options = {
      names = false,

      -- mode = "virtualtext",
      virtualtext = "■",
    }
  }
end

return M
