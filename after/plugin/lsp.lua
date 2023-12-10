local lsp = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = { 'rust_analyzer', 'lua_ls' },
})


-- lsp.on_attach(function(client, bufnr)
--   lsp.default_keymaps({ buffer = bufnr })
-- end)

vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons


-- lsp.preset('recommended')


-- keymaps to add only on buffers with LSP support (overriding grep/tags based defaults)
lsp.on_attach(function(client, bufnr)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
    { desc = '[G]o to [d]efinition', buffer = bufnr, remap = false })

  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end,
    { desc = '[G]o to [D]eclaration', buffer = bufnr, remap = false })

  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end,
    { desc = '[G]o to [R]eferences (with LSP)', buffer = bufnr, remap = false })

  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end,
    { desc = '[G]o to [I]mplementation (with LSP)', buffer = bufnr, remap = false })

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = '[K] Hover info', buffer = bufnr, remap = false })

  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end,
    { desc = '[Refactor]: re[N]ame symbol (with LSP)', buffer = bufnr, remap = false })

  vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end,
    { desc = '[A]ctions for code', buffer = bufnr, remap = false })

  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end,
    { desc = '[Format] code', buffer = bufnr, remap = false })
end)


-- lua config
require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}
