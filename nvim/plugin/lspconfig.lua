local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.flow.setup { capabilities = capabilities }

nvim_lsp.tsserver.setup {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
  on_attach = function(client)
    if require("lspconfig").util.root_pattern(".flowconfig")(vim.fn.getcwd()) then
      if client.name == "tsserver" then
        client.stop()
        return
      end
    end
  end
}

nvim_lsp.sourcekit.setup { capabilities = capabilities }

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
}

nvim_lsp.cssls.setup { capabilities = capabilities }

nvim_lsp.jedi_language_server.setup { capabilities = capabilities }

nvim_lsp.clangd.setup { capabilities = capabilities }

nvim_lsp.marksman.setup { capabilities = capabilities }

-- npm install flow-bin
nvim_lsp.flow.setup {}

nvim_lsp.mdx_analyzer.setup {}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always"
  }
})

-- setup LspAttach
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- buffer local mappings.
    -- see `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', function()
      vim.cmd([[ tab split ]])
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set('n', 'gv', function()
      vim.cmd([[ vsplit ]])
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

