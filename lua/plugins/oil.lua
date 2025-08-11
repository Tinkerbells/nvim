return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        columns = { "icon" },
        keymaps = {
          ["<C-l>"] = "actions.select",
          ["<C-h>"] = "actions.parent",
          ["<M-h>"] = "actions.select_split",
          ["<leader>e"] = "actions.close",
        },
        view_options = {
          show_hidden = true,
        },
        delete_to_trash = true,
      })
      -- Open parent directory in current window
      vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
}
