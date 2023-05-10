local M = {
  "folke/which-key.nvim",
  commit = "5224c261825263f46f6771f1b644cae33cd06995",
  event = "VeryLazy",
}

function M.config()
  require("which-key").setup {
    server = {
      on_attach = function(rt, bufnr)
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, {buffer = bufnr })
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      end,
    }
  }
end

return M
