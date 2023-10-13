local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  vue = { "eslint_d" },
  astro = { "eslint_d" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
