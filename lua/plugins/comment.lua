return {
  "numToStr/Comment.nvim",
  event = "InsertEnter",
  config = function()
    require("Comment").setup({
      padding = true,
      sticky = false,
      toggler = { line = "gcc", block = "gbc" },
      opleader = { line = "gc", block = "gb" },
      extra = { above = "gcO", below = "gco", eol = "gcA" },
      mappings = { extra = true },
    })
  end,
}
