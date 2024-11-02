return {
  "nvim-telescope/telescope.nvim",
  enabled = false,
  opts = {
    defaults = {},
  },
  keys = {
    {
      "<leader>h",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<cr>",
      desc = "Buffers",
    },
  },
}
