return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  keys = {
    -- -- I'm using these 2 keyamps already with mini.files, so avoiding conflict
    { "<leader>e", false },
    { "<leader>E", false },
    {
      "<leader>r",
      function()
        -- Function to check if NeoTree is open in any window
        local function is_neo_tree_open()
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].filetype == "neo-tree" then
              return true
            end
          end
          return false
        end
        if is_neo_tree_open() then
          -- Close NeoTree if it's open
          vim.cmd("Neotree close")
        else
          -- Open NeoTree if it's not open
          vim.cmd("Neotree reveal")
        end
      end,
      desc = "[P]Toggle current file in NeoTree",
    },
  },
}
