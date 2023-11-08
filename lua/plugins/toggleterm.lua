return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      autochdir = true,
      shade_terminals = true,
      persist_mode = true,
    })

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[:wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[:wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[:wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[:wincmd l<CR>]], opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end

    -- toggle terminal
    vim.keymap.set("n", "<C-J>", ":ToggleTerm<CR>")
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    -- toggle lazygit
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      float_opts = {
        border = "single",
      },

      -- function to run on opening the term
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,

      -- function to run on closing the terminal
      on_close = function()
        vim.cmd("startinsert!")
      end,
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
  end,
}
