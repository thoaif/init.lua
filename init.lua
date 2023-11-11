vim.opt.tags = '.tags'

require("core.mappings")
require("core.plugins")
require("core.options")
require("mason").setup()
require("mason-lspconfig").setup()
