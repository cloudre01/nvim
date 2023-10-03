local M = {
  "nvim-tree/nvim-tree.lua",
  commit = "7dcda5d3b6d2fce7b7baa471b7ad6525383e27bb",
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
  -- local tree_cb = require("nvim-tree.config").nvim_tree_callback
  local icons = require("icons")
  require("nvim-tree").setup {
    update_focused_file = {
      enable = true,
      debounce_delay = 15,
      ignore_list = {},
    },
    filters = {
      git_ignored = false,
      dotfiles = false,
      no_buffer = false,
      git_clean = false,
      custom = { "^.git$" },
      exclude = {},
    },
    renderer = {
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          bookmark = "",
          folder = {
            arrow_open = icons.ui.TriangleShortArrowDown,
            arrow_closed = icons.ui.TriangleShortArrowRight,
            default = icons.ui.Folder,
            open = icons.ui.FolderOpen,
            empty = icons.ui.EmptyFolder,
            empty_open = icons.ui.EmptyFolderOpen,
            symlink = icons.ui.FolderSymlink,
            symlink_open = icons.ui.FolderOpen,
          },
          git = {
            unstaged = icons.git.FileUnstaged,
            staged = icons.git.FileStaged,
            unmerged = icons.git.FileUnmerged,
            renamed = icons.git.FileRenamed,
            untracked = icons.git.FileUntracked,
            deleted = icons.git.FileDeleted,
            ignored = icons.git.FileIgnored,
          },
        },
      },
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
      symlink_destination = true,
    },
    hijack_directories = {
      enable = false,
      auto_open = true,
    },
    diagnostics = {
      enable = true,
      show_on_dirs = false,
      show_on_open_dirs = true,
      debounce_delay = 50,
      severity = {
        min = vim.diagnostic.severity.HINT,
        max = vim.diagnostic.severity.ERROR,
      },
      icons = {
        hint = icons.diagnostics.BoldHint,
        info = icons.diagnostics.BoldInformation,
        warning = icons.diagnostics.BoldWarning,
        error = icons.diagnostics.BoldError,
      },
    },
    on_attach = on_attach,
    view = {
      adaptive_size = false,
      centralize_selection = true,
      width = 30,
      side = "left",
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      float = {
        enable = false,
        quit_on_focus_loss = true,
        open_win_config = {
          relative = "editor",
          border = "rounded",
          width = 30,
          height = 30,
          row = 1,
          col = 1,
        },
      },
    },
  }
end

return M
