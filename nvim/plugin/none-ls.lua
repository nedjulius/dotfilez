-- none-ls is the community replacement for null-ls
-- everything is effectivelly the same except origin repo
local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    null_ls.builtins.completion.spell,
    null_ls.builtins.formatting.prettier
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
})

vim.api.nvim_create_user_command(
  "DisableLspFormatting",
  function()
    vim.api.nvim_clear_autocmd({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)

