-- LSP keymaps
local customizations = {
  { rule = "style/*", severity = "off", fixable = true },
  { rule = "format/*", severity = "off", fixable = true },
  { rule = "*-indent", severity = "off", fixable = true },
  { rule = "*-spacing", severity = "off", fixable = true },
  { rule = "*-spaces", severity = "off", fixable = true },
  { rule = "*-order", severity = "off", fixable = true },
  { rule = "*-dangle", severity = "off", fixable = true },
  { rule = "*-newline", severity = "off", fixable = true },
  { rule = "*quotes", severity = "off", fixable = true },
  { rule = "*semi", severity = "off", fixable = true },
}

return {
  "neovim/nvim-lspconfig",
  version = "*",
  opts = {
    servers = {
      pyright = {},
      ruff_lsp = {},
      gdscript = {},
      eslint = {
        settings = {
          rulesCustomizations = customizations,
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = "auto" },
        },
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "vue",
          "html",
          "markdown",
          "json",
          "jsonc",
          "yaml",
          "toml",
          "xml",
          "gql",
          "graphql",
          "astro",
          "svelte",
          "css",
          "less",
          "scss",
          "pcss",
          "postcss",
        },
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      },
      tsserver = {
        enabled = false,
      },
      lua_ls = {
        enabled = true,
      },
      vtsls = {
        enabled = false,
      },
      stylua = {
        enabled = false,
      },
      ts_ls = {
        enabled = false,
      },
    },
    setup = {
      ["typescript-tools"] = function(_, opts)
        LazyVim.lsp.on_attach(function()
          opts.handlers = {
            ["textDocument/publishDiagnostics"] = setup_ts_diagnostics,
          }
        end)
      end,

      vtsls = function(_, opts)
        LazyVim.lsp.on_attach(function()
          opts.handlers = {
            ["textDocument/publishDiagnostics"] = setup_ts_diagnostics,
          }
        end)
      end,
      eslint = function()
        local function get_client(buf)
          local clients = vim.lsp.get_clients({ name = "eslint", bufnr = buf })
          return clients and clients[1] or nil
        end

        local formatter = LazyVim.lsp.formatter({
          name = "eslint: lsp",
          primary = false,
          priority = 200,
          filter = "eslint",
        })

        if not pcall(require, "vim.lsp._dynamic") then
          formatter.format = function(buf)
            local client = get_client(buf)
            if client and client.server_capabilities then
              local ok, diag = pcall(vim.diagnostic.get, buf, {
                namespace = vim.lsp.diagnostic.get_namespace(client.id),
              })
              if ok and diag and #diag > 0 then
                vim.cmd("EslintFixAll")
              end
            end
          end
        end

        LazyVim.format.register(formatter)
      end,
    },
  },
}
