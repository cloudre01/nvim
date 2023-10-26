local M = {
  'stevearc/aerial.nvim',
  lazy = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  }
}

function M.config()
  require("aerial").setup({
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
    attach_mode = "global",
    backends = { "lsp", "treesitter", "markdown", "man" },
    filter_kind = false,
    guides = {
      mid_item   = "├╴",
      last_item  = "└╴",
      nested_top = "│ ",
      whitespace = "  ",
    },
    show_guides = true,
    -- layout = {
    --   resize_to_content = false,
    --   win_opts = {
    --     winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
    --     signcolumn = "yes",
    --     statuscolumn = " ",
    --   },
    -- },
  })
end

return M
