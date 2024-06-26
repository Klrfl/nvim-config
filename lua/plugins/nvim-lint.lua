return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      vue = { "eslint_d" },
      astro = { "eslint_d" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
      group = lint_augroup,
      callback = function()
        local function checkEslintConfigFiles()
          local files = require("lspconfig.util").root_pattern(
            "eslint.config.js",
            ".eslintrc.cjs",
            ".eslintrc.json",
            ".eslintrc.yml",
            ".eslintrc.yaml"
          )

          if files() == 1 then
            return true
          end
        end

        local function readPackageJson()
          local defaults =
            vim.fn.matchlist(vim.fn.getline(vim.fn.search("eslintConfig", "n")), "eslintConfig\\s*\\(.*\\)$")[2]
          if defaults ~= nil then
            return true
          end
        end

        if checkEslintConfigFiles() or readPackageJson() then
          lint.try_lint()
        end
      end,
    })
  end,
}
