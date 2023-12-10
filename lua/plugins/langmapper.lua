return {
  "Wansmer/langmapper.nvim",
  priority = 1,
  lazy = false,
  hack_keymap = true,
  config = function()
    require("langmapper").setup()
  end,
}
