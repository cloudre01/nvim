local M = {
  "sindrets/diffview.nvim",
  commit = "7e5a85c186027cab1e825d018f07c350177077fc",
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
