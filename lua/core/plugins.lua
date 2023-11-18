local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- finder / grep
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4', dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- color scheme
  { 'rose-pine/neovim', name = 'rose-pine', lazy = false, priority = 1000 },

  -- Git support
  { 'tpope/vim-fugitive' },

  -- comments
  { 'tpope/vim-commentary' },

  -- Git good
  { 'ThePrimeagen/vim-be-good' },

  { 'ggandor/leap.nvim' },

  -- LSP support
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},

  -- floating context at the top
  {'nvim-treesitter/nvim-treesitter-context'},

  {'nvim-treesitter/nvim-treesitter'}
})

