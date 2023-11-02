local M = {
  "sindrets/diffview.nvim",
  commit = "d38c1b5266850f77f75e006bcc26213684e1e141",
  event = "VeryLazy"
}

function M.config()
  require("diffview").setup {
    view = {
      merge_tool = {
        layout = "diff3_mixed"
      }
    }
  }
end

return M
