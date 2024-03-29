return {
  settings = {
    svelte = {
      filetypes = { 'typescript', 'javascript', 'svelte', 'html', 'css' },
      plugin = {
        svelte = {
          compilerWarnings = {
            ["a11y-click-events-have-key-events"] = "ignore",
            ["a11y-no-static-element-interactions"] = "ignore",
            ["a11y-no-noninteractive-tabindex"] = "ignore",
          }
        }
      }
    },
  },
}
