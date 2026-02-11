return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
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
}
