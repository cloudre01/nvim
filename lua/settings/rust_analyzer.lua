return {
  settings = {
    ['rust-analyzer'] = {
      -- enable clippy on save
      checkOnSave = {
        command = 'clippy',
      },
      cargo = {
        allFeatures = true
      },
      diagnostics = {
        enable = true,
      },
    },
  },
}
