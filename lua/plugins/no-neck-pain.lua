return {
  "shortcuts/no-neck-pain.nvim",
  enabled = false,
  version = "*",
  opts = {
    width = 90,
    autocmds = {
      enableOnVimEnter = true,
      enableOnTabEnter = true,
    },
    buffers = {
      colors = {
        background = "#181a1f",
      },
    },
    integrations = {
      NeoTree = {
        position = "left",
        reopen = false,
      },
    },
  },
}
