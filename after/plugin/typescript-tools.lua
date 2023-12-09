local ts_tools = require("typescript-tools")
local api = require("typescript-tools.api")

ts_tools.setup {
  on_attach = function(client, bufnr)
    -- refactoring keymaps
    vim.keymap.set("n", "<leader>ro", function() api.organize_imports() end,
      { desc = '[R]efactor: [o]rganize imports', buffer = bufnr, remap = false })

    vim.keymap.set("n", "<leader>rs", function() api.sort_imports() end,
      { desc = '[R]efactor: [s]ort imports', buffer = bufnr, remap = false })

    vim.keymap.set("n", "<leader>ru", function() api.remove_unused_imports() end,
      { desc = '[R]efactor: [u]nused imports', buffer = bufnr, remap = false })

    vim.keymap.set("n", "<leader>rU", function() api.remove_unused() end,
      { desc = '[R]efactor: [U]nused all unused statements', buffer = bufnr, remap = false })

    vim.keymap.set("n", "<leader>rm", function() api.add_missing_imports() end,
      { desc = '[R]efactor: add [m]issing imports', buffer = bufnr, remap = false })

    vim.keymap.set("n", "<leader>rA", function() api.fix_all() end,
      { desc = '[R]efactor: fix [a][l]l issues', buffer = bufnr, remap = false })

    vim.keymap.set("n", "<leader>rN", function() api.rename_file() end,
      { desc = '[R]efactor: [N]ame file', buffer = bufnr, remap = false })

    -- lsp keymaps
    vim.keymap.set("n", "gs", function() api.go_to_source_definition() end,
      { desc = '[G]o to [s]ource definition', buffer = bufnr, remap = false })

    vim.keymap.set("n", "gR", function() api.file_references() end,
      { desc = '[G]o to file [R]eferences', buffer = bufnr, remap = false })

    -- default lsp keymaps
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
      { desc = '[G]o to [d]efinition', buffer = bufnr, remap = false })

    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end,
      { desc = '[G]o to [D]eclaration', buffer = bufnr, remap = false })

    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end,
      { desc = '[G]o to [R]eferences (with LSP)', buffer = bufnr, remap = false })

    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end,
      { desc = '[G]o to [I]mplementation (with LSP)', buffer = bufnr, remap = false })

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
      { desc = '[K] Hover info', buffer = bufnr, remap = false })

    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end,
      { desc = '[Refactor]: re[N]ame symbol (with LSP)', buffer = bufnr, remap = false })

    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end,
      { desc = '[A]ctions for code', buffer = bufnr, remap = false })

    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end,
      { desc = '[Format] code', buffer = bufnr, remap = false })
  end,
  settings = {
    -- spawn additional tsserver instance to calculate diagnostics on it
    separate_diagnostic_server = true,
    -- "change"|"insert_leave" determine when the client asks the server about diagnostic
    publish_diagnostic_on = "insert_leave",
    complete_function_calls = false,
    include_completions_with_insert_text = true,
    -- CodeLens
    -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
    -- possible values: ("off"|"all"|"implementations_only"|"references_only")
    code_lens = "off",
    -- by default code lenses are displayed on all referencable values and for some of you it can
    -- be too much this option reduce count of them by removing member references from lenses
    disable_member_code_lens = true,
    -- JSXCloseTag
    -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-auto-tag,
    -- that maybe have a conflict if enable this feature. )
    jsx_close_tag = {
      enable = true,
      filetypes = { "javascriptreact", "typescriptreact" },
    }
  },
}
