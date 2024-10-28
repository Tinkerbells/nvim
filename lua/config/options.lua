local opt = vim.opt

vim.g.lazyvim_picker = "fzf"

opt.relativenumber = false
opt.conceallevel = 0
opt.swapfile = false
opt.cursorline = false -- Enable highlighting of the current line

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
