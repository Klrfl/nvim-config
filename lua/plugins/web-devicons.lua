return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    strict = true,
    override_by_extension = {
      ["astro"] = {
        icon = "",
        color = "#ffffff",
        name = "Astro",
      },
    },

    override_by_filename = {
      [".gitignore"] = {
        icon = "",
        color = "#f1502f",
        name = "Gitignore",
      },
      [".prettierrc"] = {
        icon = "",
        color = "#56b3b4",
        name = "Prettier",
      },
    },
  },
}
