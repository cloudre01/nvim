local M = {
  "axelvc/template-string.nvim",
  ft = { 'html', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' }
}

function M.config()
  require('template-string').setup()
end

return M
