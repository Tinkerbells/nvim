-- LSP keymaps
return {
  "neovim/nvim-lspconfig",
  version = "*",
  opts = {
    servers = {
      pyright = {},
      ruff_lsp = {},
      gdscript = {},
      tsserver = {
        enabled = false,
      },
      ts_ls = {
        enabled = false,
      },
      vtsls = {
        enabled = false,
        typescript = {
          format = false,
        },
        javascript = {
          format = false,
        },
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
    },
  },
  init = function()
    -- local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- keys[#keys + 1] = { "<leader>cf", false }
    -- -- remap diagnostic keymaps
    -- keys[#keys + 1] = { "]d", false }
    -- keys[#keys + 1] = { "[d", false }
  end,
}
