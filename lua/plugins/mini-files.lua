return {
  "echasnovski/mini.files",
  enabled = false,
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 60,
    },
    options = {
      use_as_default_explorer = true,
      permanent_delete = false,
    },
    mappings = {
      close = "q",
      go_in = "l",
      go_in_plus = "L",
      go_out = "h",
      go_out_plus = "H",
      mark_goto = "'",
      mark_set = "m",
      reset = ".",
      reveal_cwd = "@",
      show_help = "g?",
      synchronize = "s",
      trim_left = "<",
      trim_right = ">",
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        if not require("mini.files").close() then
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end
      end,
      desc = "Open mini.files (Directory of Current File)",
    },
    {
      "<leader>E",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
  },
}
