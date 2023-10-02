local bufferline = require('bufferline')

bufferline.setup {
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
  options = {
    mode = "tabs", -- set to "tabs" to only show tabpages instead
    themable = true,
    close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
    indicator = {
        icon = '▎', -- this should be omitted if indicator style is not 'icon'
        style = 'icon',
    },
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 20,
    diagnostics = "nvim_lsp",
    offsets = {
        {
          filetype = "NvimTree",
          text = "Si paling hengker",
          text_align = "left",
          separator = false,
        }
    },
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons =  true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    separator_style = "thin",
    always_show_bufferline = true,
  }
}

vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>')
