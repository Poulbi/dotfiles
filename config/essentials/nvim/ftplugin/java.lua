vim.keymap.set({"n", "i"}, "<LocalLeader>t", "<cmd>s/\\(\\s*\\)\\(.*\\)/\\1System.out.print(\"\\2\");<cr>")
vim.keymap.set({"n", "i"}, "<LocalLeader>i", "<cmd>s/\\(\\s*\\)\\(.*\\)/\\1System.out.print(\"\\2: \" + \\2);<cr>")
vim.keymap.set({"n", "i"}, "<LocalLeader>l", "<cmd>s/print(/println(/<cr>")
