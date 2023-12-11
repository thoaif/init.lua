require("package-info").setup({
  package_manager = "pnpm",
})

-- Define the command 'PackageInfo' to show dependency versions
vim.api.nvim_create_user_command(
  'PackageInfo',
  require('package-info').show,
  {}
)

-- Define the command 'PackageInfo hide' to hide dependency versions
vim.api.nvim_create_user_command(
  'PackageInfoHide',
  require('package-info').hide,
  {}
)
