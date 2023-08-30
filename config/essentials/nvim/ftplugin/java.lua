local home = os.getenv('HOME')
local root_markers = {'gradlew', 'mvnw', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local jdtls = require('jdtls')

local function nnoremap(rhs, lhs, bufopts, desc)
  bufopts.desc = desc
  vim.keymap.set("n", rhs, lhs, bufopts)
end

local on_attach = function(_, bufnr)
  -- Regular Neovim LSP client keymappings
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  -- Java extensions provided by jdtls
  nnoremap("<leader><leader>i", jdtls.organize_imports, bufopts, "Organize imports")
  nnoremap("<leader>ev", jdtls.extract_variable, bufopts, "Extract variable")
  nnoremap("<leader>ec", jdtls.extract_constant, bufopts, "Extract constant")
  vim.keymap.set('v', "<leader>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
    { noremap=true, silent=true, buffer=bufnr, desc = "Extract method" })
end

local config = {
	flags = {
		debounce_text_changes = 80,
	},
	cmd = {
		'jdtls',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xms4g',
		'-data', workspace_folder,
	},
	on_attach = on_attach,
	root_dir = root_dir,
}
require('jdtls').start_or_attach(config)

vim.keymap.set("n", "<LocalLeader>t", "<cmd>s/\\(\\s*\\)\\(.*\\)/\\1System.out.println(\\2);<cr>")
vim.keymap.set("i", "<LocalLeader>t", "<cmd>s/\\(\\s*\\)\\(.*\\)/\\1System.out.println(\\2);<cr><esc>A")
vim.keymap.set("n", "<LocalLeader>i", "<cmd>s/\\(\\s*\\)\\(.*\\)/\\1System.out.println(\"\\2: \" + \\2);<cr>")
vim.keymap.set("i", "<LocalLeader>i", "<cmd>s/\\(\\s*\\)\\(.*\\)/\\1System.out.println(\"\\2: \" + \\2);<cr><esc>A")
