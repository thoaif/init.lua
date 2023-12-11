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
  { "catppuccin/nvim",         name = "catppuccin", priority = 1000 },

  -- Git support
  { 'tpope/vim-fugitive' },
  { 'lewis6991/gitsigns.nvim' },

  -- comments
  { 'tpope/vim-commentary' },

  -- Git good
  { 'ThePrimeagen/vim-be-good' },

  { 'ggandor/leap.nvim' },

  -- ChatGpitty
  {
    'dpayne/CodeGPT.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    }
  },

  -- Copilot
  -- { 'github/copilot.vim' },
  { 'zbirenbaum/copilot.lua' },
  { 'zbirenbaum/copilot-cmp' },

  -- language specific
  -- typescript
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },
  { 'haydenmeade/neotest-jest' },

  -- LSP support
  { 'VonHeikemen/lsp-zero.nvim',              branch = 'v3.x' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  { 'onsails/lspkind.nvim' },
  { "elentok/format-on-save.nvim" },

  -- refactoring
  -- {
  --   "ThePrimeagen/refactoring.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- },

  -- floating context at the top
  { 'nvim-treesitter/nvim-treesitter-context' },

  { 'nvim-treesitter/nvim-treesitter' },

  -- tmux support
  { 'alexghergh/nvim-tmux-navigation',        lazy = false },

  -- testing support
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim"
    }
  },
})
