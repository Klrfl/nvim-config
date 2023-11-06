return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local status, gitsigns = pcall(require, "gitsigns")
    if not status then
      return
    end

    gitsigns.setup({
      on_attach = function(bufnr)
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "<leader>ghl", gitsigns.toggle_linehl)
        map("n", "<leader>gs", gitsigns.stage_buffer)
      end,
    })
  end,
}
