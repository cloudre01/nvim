local M = {
  "numToStr/Comment.nvim",
  commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
  event = "BufRead",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      -- event = "VeryLazy",
      commit = "92e688f013c69f90c9bbd596019ec10235bc51de",
    },
  },
}

function M.config()
  require("Comment").setup({
    pre_hook = function(...)
      local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      if loaded and ts_comment then
        return ts_comment.create_pre_hook()(...)
      end
    end
  })
end

return M
