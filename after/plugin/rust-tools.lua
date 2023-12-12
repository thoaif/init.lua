require("rust-tools").setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<leader>k", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })

      vim.keymap.set("n", "<leader>aa", require("rust-tools").code_action_group.code_action_group, { buffer = bufnr })

      -- Refactors
      -- vim.keymap.set("n", "<leader>rk", require("rust-tools").move_item.move_item(true), { buffer = bufnr })
      -- vim.keymap.set("n", "<leader>rj", require("rust-tools").move_item.move_item(false), { buffer = bufnr })
    end,
  },
})
