local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup {
  options = {
    mode = 'tabs',
    diagnostics = 'nvim_lsp',
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    groups = {
      items = {
        require('bufferline.groups').builtin.pinned:with({ icon = '' })
      }
    }
  },
  highlights = {
    fill = {
      bg = '#1e2030',
    },
    background = {
      bg = '#181926',
    },
    separator = {
      fg = '#1e2030',
      bg = '#181926',
    },
    separator_selected = {
      fg = '#1e2030',
      bg = '#24273a'
    },
    indicator_selected = {
      bg = '#ed8796',
      fg = '#ed8796',
    },
  },
}

