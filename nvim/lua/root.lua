vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

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
vim.opt.mouse = nil

vim.opt.path:append { '**' }
vim.opt.formatoptions:append { 'r' }

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste"
})

-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- italics
vim.cmd([[let &t_ZH="\e[3m"]])
vim.cmd([[let &t_ZR="\e[23m"]])

