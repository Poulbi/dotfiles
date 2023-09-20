local pid = vim.fn.getpid()

require'lspconfig'.omnisharp.setup{
    cmd = { "/usr/bin/omnisharp", "--languageserver" , "--hostPID", tostring(pid) }
    -- Additional configuration can be added here
}
