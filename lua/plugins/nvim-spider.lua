return {
  "chrisgrieser/nvim-spider",
  keys = {
    { "w", ":lua require('spider').motion('w')<CR>", desc = "Spider-w" },
    { "e", ":lua require('spider').motion('e')<CR>", desc = "Spider-e" },
    { "b", ":lua require('spider').motion('b')<CR>", desc = "Spider-b" },
    { "ge", ":lua require('spider').motion('ge')<CR>", desc = "Spider-ge" },
  },
}
