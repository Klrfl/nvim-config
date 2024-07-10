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
      "scss",
      "javascript",
      "typescript",
      "vue",
      "astro",
      "tsx",
      "json",
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
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- blade grammar
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }
  end,
}
