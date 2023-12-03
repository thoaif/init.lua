require("catppuccin").setup({
  flavour = "mocha",
  background = {   -- :h background
    light = "latte",
    dark = "mocha",
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
  }
})

vim.cmd.colorscheme "catppuccin"
