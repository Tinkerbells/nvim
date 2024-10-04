vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, { pattern = "*", command = "silent! wa" })

vim.cmd("autocmd VimEnter *.* :ZenMode")

vim.api.nvim_create_autocmd({ "VimEnter", "BufReadPost" }, {
  pattern = { "*.md", "*.txt", "*.go" },
  callback = function()
    local zen_mode = require("zen-mode")

    zen_mode.open()
  end,
})
-- Start server using a pipe path on VimEnter
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
    if not vim.loop.fs_stat(pipepath) then
      vim.fn.serverstart(pipepath)
    end
  end,
})
