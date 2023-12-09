local lsp = require('lsp-zero')
local api = require "typescript-tools.api"


lsp.on_attach(function(client, bufnr)
  if client == 'tsserver' then
    vim.keymap.set("n", "ro", function(is_sync) api.organize_imports(is_sync) end,
      { desc = '[R]efactor: [o]rganize imports', buffer = bufnr, remap = false })
  end
end)
