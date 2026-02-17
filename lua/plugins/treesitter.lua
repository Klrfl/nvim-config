return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  cmd = {
    "TSInstall",
    "TSBufEnable",
    "TSBufDisable",
    "TSModuleInfo",
    "TSInstallFromGrammar",
  },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "html",
      "css",
      "javascript",
      "c",
      "lua",
      "markdown",
      "markdown_inline",
    },

    autotag = {
      enable = true,
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = true,
    },
  },
  config = function()
    local filetypes_i_work_on = {
      "lua",
      "json",
      "markdown",
      "c",
      "cpp",

      "html",
      "css",
      "scss",

      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",

      "vue",
      "svelte",
      "astro",
      "python",
      "blade",
      "php",
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes_i_work_on,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
