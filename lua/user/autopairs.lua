local M = {
  "windwp/nvim-autopairs",
  commit = "0f04d78619cce9a5af4f355968040f7d675854a1",
  event = "InsertEnter",
  dependencies = {
    {
      "hrsh7th/nvim-cmp",
      commit = "51260c02a8ffded8e16162dcf41a23ec90cfba62",
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
