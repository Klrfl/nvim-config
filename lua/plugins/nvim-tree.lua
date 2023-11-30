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

  -- open nvimtree on startup
  -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
  --[[ local function open_nvim_tree()
      require("nvim-tree.api").tree.open()
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree }) ]]

  -- vim.keymap.set("n", "<leader>b", ":NvimTreeFindFileToggle<CR>")
}
