local M = {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  ft = "markdown",
  keys = {{
    "gm", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview"
  }}
}

function M.config() 
  vim.g.mkdp_auto_close = true
  vim.g_mkdp_open_to_the_world = false
  vim.g_mkdp_open_ip = "127.0.0.1"
  vim.g.mkdp_port = "8888"
  vim.g.mkdp_browser= ""
  vim.g.mkdp_echo_preview_url = true
  vim.g.mkdp_page_title = "${name}"
end

return M
