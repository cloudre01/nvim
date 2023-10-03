local M = {
  "nvim-treesitter/nvim-treesitter",
  commit = "0ba881b7a2af0e24962e4522cf15ebd642261a90",
  event = "BufReadPost",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
      commit = "729d83ecb990dc2b30272833c213cc6d49ed5214",
    },
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
      commit = "45d0237c427baba8cd05e0ab26d30e2ee58c2c82"
    },
  },
}
function M.config()
  local treesitter = require "nvim-treesitter"
  local configs = require "nvim-treesitter.configs"

  configs.setup {
    ensure_installed = {
      "lua",
      "markdown",
      "markdown_inline",
      "bash",
      "python",
      "rust",
      "html",
      "tsx",
      "javascript",
      "go",
      "sql",
      "zig",
    },                       -- put the language you want in this array
    auto_install = true,
    -- ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "" }, -- List of parsers to ignore installing
    sync_install = false,    -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
      enable = true,       -- false will disable the whole extension
      disable = { "css" }, -- list of language that will be disabled
    },
    autopairs = {
      enable = true,
    },
    autotag = {
      enable = true,
      enable_close_on_slash = false,
    },
    indent = { enable = true, disable = { "python", "css" } },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  }
end

return M
