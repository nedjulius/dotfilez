local status, telescope = pcall(require, "telescope")
if (not status) then return end

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

telescope.load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('', '<leader>fg', builtin.live_grep, { noremap = true })
vim.keymap.set('', '<leader>fb', builtin.buffers, { noremap = true })
vim.keymap.set('', '<leader>fh', builtin.help_tags, { noremap = true })
vim.keymap.set('', '<leader>ff', builtin.find_files, { noremap = true })

