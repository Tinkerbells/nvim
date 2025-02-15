local opt = vim.opt

vim.g.lazyvim_picker = "fzf"
vim.g.snacks_animate = false
-- Set to false to disable auto format
vim.g.lazyvim_eslint_auto_format = true
-- Enable this option to avoid conflicts with Prettier.
vim.g.lazyvim_prettier_needs_config = true

opt.relativenumber = false
opt.conceallevel = 0
opt.swapfile = false
opt.cursorline = false -- Enable highlighting of the current line

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
