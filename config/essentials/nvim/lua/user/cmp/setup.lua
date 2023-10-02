local cmp = require'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-c>'] = cmp.mapping.abort(),
		['<C-k>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp'},
		{ name = 'path' },
		{ name = 'luasnip' },
		{ name = 'nvim_lsp_signature_help' },
	}),
	preselect = cmp.PreselectMode.None,
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' },
	})
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
})
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline', keyword_length = 4 }
	}),
})

local function nnoremap(rhs, lhs, bufopts, desc)
  bufopts.desc = desc
  vim.keymap.set("n", rhs, lhs, bufopts)
end

vim.keymap.set('c', '<tab>', '<C-z>', { silent = false }) -- to fix cmp
-- Regular Neovim LSP client keymappings
local bufopts = { noremap=true, silent=true }
nnoremap('gD', vim.lsp.buf.declaration, bufopts, "Go to declaration")
nnoremap('gd', vim.lsp.buf.definition, bufopts, "Go to definition")
nnoremap('gi', vim.lsp.buf.implementation, bufopts, "Go to implementation")
nnoremap('K', vim.lsp.buf.hover, bufopts, "Hover text")
nnoremap('<C-k>', vim.lsp.buf.signature_help, bufopts, "Show signature")
nnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
nnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
nnoremap('<leader>wl', function()
print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts, "List workspace folders")
nnoremap('<leader>D', vim.lsp.buf.type_definition, bufopts, "Go to type definition")
nnoremap('<leader>rn', vim.lsp.buf.rename, bufopts, "Rename")
nnoremap('<leader><Return>', vim.lsp.buf.code_action, bufopts, "Code actions")
vim.keymap.set('v', "<leader><Return>", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
{ noremap=true, silent=true, desc = "Code actions" })
nnoremap('<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts, "Format file")
