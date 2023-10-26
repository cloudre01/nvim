local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  commit = "db09b6c691def0038c456551e4e2772186449f35",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      commit = "267282a9ce242bbb0c5dc31445b6d353bed978bb",
      lazy = true,
    },
  },
}

function M.config()
  local null_ls = require "null-ls"
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  -- https://github.com/prettier-solidity/prettier-plugin-solidity
  null_ls.setup {
    debug = false,
    sources = {
      formatting.prettierd.with {
        extra_filetypes = { "toml" },
        env = {
          PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/.prettierrc"),
        }
      },
      formatting.eslint,
      formatting.black.with { extra_args = { "--fast" } },
      formatting.stylua,
      formatting.google_java_format,
      formatting.gofumpt,
      formatting.goimports_reviser,
      formatting.golines,
      formatting.rustfmt,
      formatting.forge_fmt,
      diagnostics.flake8,
    },
  }
end

return M
