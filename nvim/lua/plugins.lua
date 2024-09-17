local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  'L3MON4D3/LuaSnip',
  'neovim/nvim-lspconfig',
  'nvim-tools/none-ls.nvim',
  'windwp/nvim-ts-autotag',
  'windwp/nvim-autopairs',
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-lualine/lualine.nvim',
  'nvim-lua/plenary.nvim',
  {
   'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'norcalli/nvim-colorizer.lua',
  'lewis6991/gitsigns.nvim',
  {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = "markdown"
  },
  'numToStr/Comment.nvim',
  'nvim-tree/nvim-web-devicons',
  'nvim-tree/nvim-tree.lua',
  'f-person/git-blame.nvim',
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  }
})

