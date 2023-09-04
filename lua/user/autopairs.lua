local M = {
  "windwp/nvim-autopairs",
  commit = "ae5b41ce880a6d850055e262d6dfebd362bb276e",
  event = "InsertEnter",
  dependencies = {
    {
      "hrsh7th/nvim-cmp",
      commit = "5dce1b778b85c717f6614e3f4da45e9f19f54435",
      event = {
        "InsertEnter",
        "CmdlineEnter",
      },
    },
  },
}

function M.config()
  require("nvim-autopairs").setup {
    check_ts = true, -- treesitter integration
    disable_filetype = { "TelescopePrompt" },
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  }

  -- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  -- local cmp = require "cmp"
  --
  -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
