require("parrot").setup {
  -- Providers must be explicitly added to make them available.
  providers = {
    anthropic = {
      api_key = { "gpg", "--decrypt", vim.fn.expand("$HOME") .. "/anthropic.txt.gpg" },
    }
  },
}


vim.keymap.set("n", "<leader>po", ":PrtChatToggle<Enter>", { noremap = true })
vim.keymap.set("n", "<leader>pn", ":PrtChatNew<Enter>", { noremap = true })
vim.keymap.set("n", "<leader>p<Enter>", ":PrtChatResponde<Enter>", { noremap = true })
vim.keymap.set("n", "<leader>pc", ":PrtChatStop<Enter>", { noremap = true })
vim.keymap.set("n", "<leader>fp", ":PrtChatFinder<Enter>", { noremap = true })
