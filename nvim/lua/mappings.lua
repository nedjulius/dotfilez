local keymap = vim.keymap

-- local find and replace
keymap.set('', 'gr', '*:%s//<C-R>/', { noremap = true })

-- remove highlight search
keymap.set('n', '<C-L>', ':nohlsearch<CR>', { noremap = true })

-- nvim-tree mappings
keymap.set('', '<C-n>', ':NvimTreeToggle<CR>')
keymap.set('', '<F6>', ':NvimTreeToggle<CR>')

-- git-blame.nvim mappings
keymap.set('', '<leader>bt', ':GitBlameToggle<CR>')
keymap.set('', '<leader>bo', ':GitBlameOpenFileURL<CR>')
vim.g.gitblame_date_format = '%r'
vim.g.gitblame_enabled = 0

-- setup vim diagnostic float
keymap.set('n', '<space>e', vim.diagnostic.open_float)
keymap.set('n', '[p', vim.diagnostic.goto_prev)
keymap.set('n', '[n', vim.diagnostic.goto_next)

-- reload config without restart
keymap.set('n', '<leader>rr', ':so %<CR>')

