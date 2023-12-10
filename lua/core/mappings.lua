vim.g.mapleader = " "
vim.keymap.set("n", "-", vim.cmd.Ex)

vim.keymap.set('n', '<leader>e', ':Lexplore<cr> :vertical resize 30<cr>', { desc = 'Go to [E]xplorer' })

-- Previous and next buffer
vim.keymap.set('n', '<leader>n', '<esc>:bn<cr>', { desc = '[N]ext buffer' })
vim.keymap.set('n', '<leader>N', '<esc>:bp<cr>', { desc = '[P]previous buffer' })
vim.keymap.set('n', '<leader>T', ':botright vnew term://bash <cr>i', { desc = '[T]terminal' })


-- function RTags()
-- vim.cmd [[!ctags -f .tags --languages=ruby --exclude=.git -R .]]
-- end

-- vim.keymap.set("n", "rT", RTags)
