local M = {
  "folke/todo-comments.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}

function M.config()
  -- local status_ok, todo_comments = pcall(require, "todo-comments")
  -- if not status_ok then
  --   return
  -- end

  require('todo-comments').setup()
end

return M
