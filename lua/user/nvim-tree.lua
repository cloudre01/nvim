local M = {
  "kyazdani42/nvim-tree.lua",
  commit = "904f95cd9db31d1800998fa428e78e418a50181d",
  event = "VimEnter"
}

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
end

function M.config()
  local tree_cb = require("nvim-tree.config").nvim_tree_callback
  require("nvim-tree").setup {
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    filters = {
      git_ignored = false,
      dotfiles = false,
      custom = {"^.git$"},
    },
    renderer = {
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    on_attach = on_attach,
    view = {
      width = 30,
      side = "left",
      mappings = {
        list = {
          { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
          { key = "h",                  cb = tree_cb "close_node" },
          { key = "v",                  cb = tree_cb "vsplit" },
        },
      },
    },
  }
end

return M
