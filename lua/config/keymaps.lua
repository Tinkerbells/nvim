local map = LazyVim.safe_keymap_set
map("n", "<C-a>", "gg<S-v>G <CR>", { noremap = true, silent = true, desc = "Select all" })

local diagnostic_goto = function(next)
  local count = next and 1 or -1
  return function()
    vim.diagnostic.jump({ count = count, float = true, severity = { min = vim.diagnostic.severity.ERROR } })
  end
end

map("n", "<C-n>", diagnostic_goto(true), { desc = "Next Error" })
map("n", "<C-p>", diagnostic_goto(false), { desc = "Prev Error" })
