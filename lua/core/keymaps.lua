vim.g.mapleader = " "

local keymap = vim.keymap

-- insert mode --




-- visual mode --
-- 向下移动多行
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- 向上移动多行
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })



-- normal mode --
-- windows
keymap.set("n","<leader>|", "<C-w>v") -- 水平新增窗口
keymap.set("n","<leader>-", "<C-w>s") -- 垂直新增窗口


-- 使用 Ctrl+方向键在窗口间切换
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })


-- 取消高亮
keymap.set("n","<leader>nh", ":nohl<CR>")


-- plugins --
-- nvim-tree
keymap.set("n","<leader>e", ":NvimTreeToggle<CR>")


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- persistence
-- 我不是很确定要不要绑快捷键，所以就先没有绑定了























