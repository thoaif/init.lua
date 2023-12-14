local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

local javascript = {
  formatters.if_file_exists({
    pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
    formatter = formatters.prettierd,
  }),

  formatters.if_file_exists({
    pattern = { ".eslintrc.*", ".eslint.*", },
    formatter = formatters.shell({
      cmd = { "cat", "%", "|", "eslint_d", "--fix-to-stdout", "--stdin" }
    })
  }),
}



format_on_save.setup({
  exclude_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    css = formatters.lsp,
    html = formatters.lsp,
    json = formatters.lsp,
    lua = formatters.lsp,
    markdown = formatters.prettierd,
    rust = formatters.lsp,
    scss = formatters.lsp,
    sh = formatters.shfmt,
    typescript = javascript,
    typescriptreact = javascript,
    yaml = formatters.lsp,
    javascript = javascript,
  },
  -- Optional: fallback formatter to use when no formatters match the current filetype
  fallback_formatter = {
    formatters.remove_trailing_whitespace,
    formatters.remove_trailing_newlines,
  },

  -- By default, all shell commands are prefixed with "sh -c" (see PR #3)
  -- To prevent that set `run_with_sh` to `false`.
  run_with_sh = false,
})
