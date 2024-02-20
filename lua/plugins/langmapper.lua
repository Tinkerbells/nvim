return {
  "Wansmer/langmapper.nvim",
  priority = 1,
  lazy = false,
  hack_keymap = true,
  config = function()
    local langmapper = require("langmapper")
    langmapper.setup()
    langmapper.hack_get_keymap()
  end,
}
