local map = LazyVim.safe_keymap_set
map("n", "<C-a>", "gg<S-v>G <CR>", { noremap = true, silent = true, desc = "Select all" })
