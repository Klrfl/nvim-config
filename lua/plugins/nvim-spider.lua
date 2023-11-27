return {
  "chrisgrieser/nvim-spider",
  keys = {
    { "w", ":lua require('spider').motion('w')<CR>", desc = "Spider-w", mode = { "n", "o", "x" } },
    { "e", ":lua require('spider').motion('e')<CR>", desc = "Spider-e", mode = { "n", "o", "x" } },
    { "b", ":lua require('spider').motion('b')<CR>", desc = "Spider-b", mode = { "n", "o", "x" } },
    { "ge", ":lua require('spider').motion('ge')<CR>", desc = "Spider-ge", mode = { "n", "o", "x" } },
  },
}
