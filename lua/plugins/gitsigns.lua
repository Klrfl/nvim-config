return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  opts = {
    on_attach = function(bufnr)
      local gitsigns = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map("n", "<leader>hl", gitsigns.toggle_linehl)
      map("n", "<leader>hs", gitsigns.stage_hunk)
      map("n", "<leader>hr", gitsigns.reset_hunk)
      map("n", "<leader>hn", gitsigns.next_hunk)
      map("n", "<leader>hp", gitsigns.prev_hunk)
      map("v", "<leader>hs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end)
      map("v", "<leader>hr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end)
      map("n", "<leader>hb", gitsigns.stage_buffer)
      map("n", "<leader>hR", gitsigns.reset_buffer)
      map("n", "<leader>hd", gitsigns.diffthis)
      map("n", "<leader>hD", function()
        gitsigns.diffthis("~")
      end)
    end,
  },
}
