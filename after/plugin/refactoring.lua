-- require('refactoring').setup({
--   prompt_func_return_type = {},
--   prompt_func_param_type = {},
--   printf_statements = {},
--   print_var_statements = {},
-- })

-- vim.keymap.set("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end)

-- vim.keymap.set("x", "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end)
-- -- Extract function supports only visual mode
-- vim.keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end)
-- -- Extract variable supports only visual mode
-- -- vim.keymap.set("n", "<leader>rI", function() require('refactoring').refactor('Inline Function') end)
-- -- -- Inline func supports only normal
-- -- vim.keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end)
-- -- -- Inline var supports both normal and visual mode

-- vim.keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end)

-- vim.keymap.set("n", "<leader>rB", function() require('refactoring').refactor('Extract Block To File') end)
-- -- Extract block supports only normal mode


-- -- telescope integration
-- require("telescope").load_extension("refactoring")

-- vim.keymap.set(
--   { "n", "x" },
--   "<leader>rr",
--   function() require('telescope').extensions.refactoring.refactors() end
-- )
