local map = LazyVim.safe_keymap_set
map("n", "<C-a>", "gg<S-v>G <CR>", { noremap = true, silent = true, desc = "Select all" })

-- lspconfig
local diagnostic_goto = function(next)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  return function()
    go({ severity = { min = "ERROR" } })
  end
end
map("n", "<C-n>", diagnostic_goto(true), { desc = "Next Error" })
map("n", "<C-p>", diagnostic_goto(false), { desc = "Prev Error" })
