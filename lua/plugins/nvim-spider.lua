return {
  "chrisgrieser/nvim-spider",
  lazy = true,
  keys = {
    { "w", ":lua require('spider').motion('w')<CR>", desc = "Spider-w", silent = true },
    { "e", ":lua require('spider').motion('e')<CR>", desc = "Spider-e", silent = true },
    { "b", ":lua require('spider').motion('b')<CR>", desc = "Spider-b", silent = true },
    { "ge", ":lua require('spider').motion('ge')<CR>", desc = "Spider-ge", silent = true },
  },
}
