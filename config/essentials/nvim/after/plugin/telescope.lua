require('telescope').setup({
	defaults = {
		path_display = {
			shorten = {
				len = 3, exclude = {1, -1}
			},
			truncate = true
		},
		dynamic_preview_title = true,
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
})
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.git_files)
vim.keymap.set('n', '<leader>fw', builtin.live_grep)
-- symbols
vim.keymap.set("n", "<leader>tse", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji', 'gitmoji'} }<CR>")
vim.keymap.set("n", "<leader>tsn", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'nerd'} }<CR>")
vim.keymap.set("n", "<leader>tsj", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'julia'} }<CR>")
