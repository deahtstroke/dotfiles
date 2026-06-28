--- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Resize windows
vim.keymap.set('n', '<C-Up>', '<C-w>+', { desc = 'Increase vertical window size' })
vim.keymap.set('n', '<C-Down>', '<C-w>-', { desc = 'Decrease vertical window size' })
vim.keymap.set('n', '<C-Right>', '<C-w><', { desc = 'Increase horizontal window size' })
vim.keymap.set('n', ' <C-Left>', '<C-w>>', { desc = 'Decrease horizontal window size' })

-- NOTE: Some terminals have coliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Bufferline keymaps
vim.keymap.set('n', '<A-l>', '<Cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<A-h>', '<Cmd>BufferLineCyclePrev<CR>')

-- Show diagnostic in floating window
vim.keymap.set('n', '<S-e>', vim.diagnostic.open_float, { desc = 'Open Diagnostic float' })
