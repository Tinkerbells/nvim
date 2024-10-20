return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "warm",
      styles = {
        comments = "italic",
        funcitons = "italic,bold",
      },
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
      highlights = {
        ["comments"] = { fg = "$dark_purple", fmt = "none" },
        ["@comment"] = { fg = "$dark_purple", fmt = "none" },
        ["@lsp.type.comment"] = { fg = "$dark_purple", fmt = "none" },
        ["LineNr"] = { fg = "$light_grey", fmt = "none" },
        ["Whitespace"] = { fg = "$grey", fmt = "none" },
        ["@tag"] = { fg = "$yellow" },
        ["@tag.attribute"] = { fg = "$red" },
        ["@constructor"] = { fg = "$blue" },
        ["@punctuation.bracket"] = { fg = "$red" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
