return {
  "numToStr/Comment.nvim",
  event = "InsertEnter",
  opts = {
    padding = true,
    sticky = false,
    toggler = { line = "gcc", block = "gbc" },
    opleader = { line = "gc", block = "gb" },
    extra = { above = "gcO", below = "gco", eol = "gcA" },
    mappings = { extra = true },
  },
}
