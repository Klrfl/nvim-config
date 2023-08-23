require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
  },

  sections = {
    lualine_c = {
      {
        'filename',
        file_status = true
      }
    }
  }
}
