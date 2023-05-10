local M = {
  "folke/tokyonight.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

M.name = "tokyonight-night"
function M.config()
  local status_tokyo_ok, tokyonight = pcall(require, "tokyonight")
  if not status_tokyo_ok then
    return
  end

  tokyonight.setup({
  })

  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M
