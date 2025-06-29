return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      vue = { "eslint_d" },
      svelte = { "eslint_d" },
      astro = { "eslint_d" },
    }

    local function eslint_config_exists()
      local config_files = {
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
        "eslint.config.ts",
        "eslint.config.mts",
        "eslint.config.cts",
      }

      local cwd = vim.fn.getcwd()

      for _, file in ipairs(config_files) do
        local ok, err = vim.loop.fs_stat(cwd .. "/" .. file)
        if err then
          return false
        end

        if ok then
          return true
        end
      end

      return false
    end

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
      group = lint_augroup,
      callback = function()
        if eslint_config_exists() then
          lint.try_lint()
        end
      end,
    })
  end,
}
