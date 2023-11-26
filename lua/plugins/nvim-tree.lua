return {
  "nvim-tree/nvim-tree.lua", -- file explorer
  config = function()
    local HEIGHT_RATIO = 0.8
    local WIDTH_RATIO = 0.8

    require("nvim-tree").setup({
      view = {
        centralize_selection = true,
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
            return {
              border = "rounded",
              relative = "editor",
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        },
        width = function()
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
      },
    })

    -- open nvimtree on startup
    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
    local function open_nvim_tree()
      -- open the tree
      require("nvim-tree.api").tree.open()
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

    vim.keymap.set("n", "<leader>b", ":NvimTreeFindFileToggle<CR>")
  end,
}
