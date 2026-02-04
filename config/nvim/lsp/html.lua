vim.lsp.config("html", {
  cmd = { "vscode-html-language-server", "--stdio" },
  root_dir = vim.fs.root(0, {
    "package.json",
    ".git",
  }),
  capabilities = _G.cmp_capabilities,
  on_attach = on_attach,
})
