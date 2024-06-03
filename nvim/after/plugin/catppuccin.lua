local status, catppuccin = pcall(require, "catppuccin")
if (not status) then return end

catppuccin.setup {
  flavour = 'macchiato',
  no_italic = false,
  show_end_of_buffer = false,
  dim_inactive = {
    enabled = false,
    shade = 'dark',
    percentage = 0.15,
  },
  styles = {
    comments = { 'italic' },
    conditionals = {},
    keywords = { 'italic' },
    properties = { 'italic' },
    functions = { 'italic' },
    types = { 'italic' },
    strings = {},
    booleans = {},
    operators = {},
    loops = {},
  },
  color_overrides = {
    mocha = {
      base = '#0c0e16',
      mantle = '#08090e'
   },
  },
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
  }
}

vim.cmd.colorscheme 'catppuccin'

