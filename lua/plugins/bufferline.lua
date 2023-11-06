return {
  "akinsho/bufferline.nvim", --tabs!!
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        mode = "tabs", -- set to "tabs" to only show tabpages instead
        themable = true,
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = " Si paling hengker",
            text_align = "left",
            separator = true,
          },
        },
        separator_style = "thin",
      },
    })

    vim.keymap.set("n", "te", ":tabedit<CR>")
    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
  end,
}
