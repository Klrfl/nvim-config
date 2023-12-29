return {
  "nvim-tree/nvim-tree.lua", -- file explorer
  keys = {
    { "<leader>b", ":NvimTreeToggle<CR>", desc = "Open NvimTree" },
  },
  cmd = "NvimTreeToggle",
  opts = {
    view = {
      side = "right",
      width = 35,
    },
  },
}
