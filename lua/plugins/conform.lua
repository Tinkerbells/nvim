return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format({ formatters = { "injected" } })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
}
