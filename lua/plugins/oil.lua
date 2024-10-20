return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        columns = { "icon" },
        keymaps = {
          ["l"] = "actions.select",
          ["h"] = "actions.parent",
          ["<C-h>"] = false,
          ["<M-h>"] = "actions.select_split",
          ["<leader>e"] = "actions.close",
        },
        view_options = {
          show_hidden = true,
        },
        float = {
          -- Padding around the floating window
          padding = 2,
          max_width = 75,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          -- preview_split: Split direction: "auto", "left", "right", "above", "below".
          preview_split = "auto",
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          override = function(conf)
            return conf
          end,
        },
      })
      -- Open parent directory in current window
      vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
}
