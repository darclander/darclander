-- vim.lsp.config("clangd", {
-- 	cmd = { "/usr/bin/clangd", "--background-index", "--clang-tidy" },
-- 	root_dir = vim.fs.find({ ".git", "compile_commands.json" }, { upward = true })[2]
-- 				  or vim.loop.cwd(),
-- 	capabilities = _G.cmp_capabilities,
-- 	on_attach = on_attach,
-- })

