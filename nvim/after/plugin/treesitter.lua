local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup {
  ensure_installed = { "c", "lua", "rust", "cpp", "javascript", "java", "html", "css", "json", "markdown", "scala", "yaml", "typescript", "python", "http", "regex", "tsx", "bash" },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  }
}

