local M = {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  }
}

function M.config()
  local home = vim.fn.expand("$HOME")
  local pin = vim.fn.expand("$GPG_PIN")
  require("chatgpt").setup({
    api_key_cmd = "gpg -d " .. home .. "/.config/secrets/open_api_secret.gpg"
  })
end

return M
