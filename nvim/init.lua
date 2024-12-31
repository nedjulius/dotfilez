require('root')
require('plugins')
require('mappings')

-- CONFIG --
vim.cmd("autocmd!")
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.ruler = true
vim.opt.textwidth = 0
vim.opt.modeline = true
vim.opt.linespace = 0
vim.opt.joinspaces = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 5
vim.opt.display:append { 'lastline' }
vim.opt.startofline = false
vim.opt.errorbells = false
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.guifont = 'JetbrainsMono_Nerd_Font:h11'
vim.opt.termguicolors = true
vim.opt.timeoutlen = 250
vim.opt.magic = true
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.fileformats = { 'unix', 'dos', 'mac' }
vim.opt.list = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.laststatus = 2
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.mouse = ""
vim.opt.hidden = true
vim.opt.cursorline = true
vim.opt.path:append { '**' }
vim.opt.formatoptions:append { 'r' }
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste"
}) -- set nopaste after insert mode
vim.g.gitblame_date_format = '%r' -- GitBlame date format
vim.g.gitblame_enabled = 0
vim.g.mapleader = " " -- set leader key
-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- italics
vim.cmd([[let &t_ZH="\e[3m"]])
vim.cmd([[let &t_ZR="\e[23m"]])

-- MAPPINGS --
local keymap = vim.keymap
keymap.set('', 'gr', '*:%s//<C-R>/', { noremap = true }) -- local find and replace
keymap.set('n', '<C-L>', ':nohlsearch<CR>', { noremap = true }) -- remove highlight search
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
-- buffers
keymap.set('n', '<leader>bp', ':bprev<CR>')
keymap.set('n', '<leader>bn', ':bnext<CR>')


-- BOOTSTRAP LAZY.NVIM --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- PLUGINS -- 
require("lazy").setup({
  spec = {
    { 'nvim-lualine/lualine.nvim', opts = {} },
    { 'nvim-lua/plenary.nvim', opts = {} },
    {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      version = false,
      dependencies = { 'nvim-lua/plenary.nvim' },
      opts = {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      },
      keys = function()
        local builtin = require('telescope.builtin')

        return {
          { '<leader>/', builtin.live_grep, desc = 'File grep' },
          { '<C-p>', builtin.find_files, desc = 'Find files' },
          { '<leader>fh', builtin.help_tags, desc = 'Help tags' },
          {
            "<leader>fb",
            "<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>",
            desc = "Buffers",
          },
          { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        }
      end,
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    {
      'norcalli/nvim-colorizer.lua',
      opts = {
        'css';
        'javascript';
        html = { mode = 'foreground' }
      }
    },
    { 'lewis6991/gitsigns.nvim', opts = {} },
    { 'JoosepAlviste/nvim-ts-context-commentstring', opts = {} },
    {
      'numToStr/Comment.nvim',
      dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
      opts = {}
    },
    { 'nvim-tree/nvim-web-devicons', opts = {} },
    { 'nvim-tree/nvim-tree.lua', opts = {} },
    { 'f-person/git-blame.nvim', opts = {} },
    { 'Shatur/neovim-ayu', opts = {} }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "ayu-dark" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

