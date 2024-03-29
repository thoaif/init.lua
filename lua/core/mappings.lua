vim.g.mapleader = " "
vim.keymap.set("n", "-", vim.cmd.Ex)

vim.keymap.set('n', '<leader>e', ':Lexplore<cr> :vertical resize 30<cr>', { desc = 'Go to [E]xplorer' })

-- Previous and next buffer
vim.keymap.set('n', '<leader>n', '<esc>:bn<cr>', { desc = '[N]ext buffer' })
vim.keymap.set('n', '<leader>N', '<esc>:bp<cr>', { desc = '[P]previous buffer' })

-- disable arrow keys
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Up>', '<Nop>', opts)
vim.keymap.set('n', '<Down>', '<Nop>', opts)
vim.keymap.set('n', '<Left>', '<Nop>', opts)
vim.keymap.set('n', '<Right>', '<Nop>', opts)

-- remap new panes
vim.keymap.set('n', '<A-w>h', ':leftabove vsplit<CR>', opts)
vim.keymap.set('n', '<A-w>l', ':rightbelow vsplit<CR>', opts)
vim.keymap.set('n', '<A-w>k', ':leftabove split<CR>', opts)
vim.keymap.set('n', '<A-w>j', ':rightbelow split<CR>', opts)

-- invert 0 and _
vim.keymap.set('n', '_', '0')
vim.keymap.set('n', '0', '_')

-- Copying to system clipboard
-- From current cursor position to EOL (normal mode)
vim.keymap.set({ 'n' }, '<A-y>', '"+y$')
-- Current selection (visual ttttr
vim.keymap.set({ 'v' }, '<A-y>', '"+y')

-- Cutting to system clipboard
-- From current cursor position to EOL (normal mode)
vim.keymap.set({ 'n' }, '<A-x>', '"+d$')
-- Current selection (visual mode)
vim.keymap.set({ 'v' }, '<A-x>', '"+d')


-- Paste from system clipboard
vim.keymap.set({ 'n' }, '<A-p>', '"+p')
vim.keymap.set({ 'v' }, '<A-p>', '"+p')
