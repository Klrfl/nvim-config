return {
  "nvim-tree/nvim-tree.lua", -- file explorer
  lazy = false,
  keys = {
    { "<leader>b", ":NvimTreeToggle<CR>", desc = "Open NvimTree" },
  },
  opts = {
    view = {
      side = "right",
      width = 35,
    },
  },
}
