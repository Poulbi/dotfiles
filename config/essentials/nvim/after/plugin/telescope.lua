local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- symbols
vim.keymap.set("n", "<leader>tse", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji', 'gitmoji'} }<CR>")
vim.keymap.set("n", "<leader>tsn", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'nerd'} }<CR>")
vim.keymap.set("n", "<leader>tsj", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'julia'} }<CR>")
