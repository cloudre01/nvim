local M = {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
}

function M.config()
  local context = require "treesitter-context"
  context.setup{}
  vim.keymap.set("n", "<leader>ut", "<cmd>TSContextToggle<CR>")
end

return M
