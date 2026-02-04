vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  root_dir = vim.fs.root(0, {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
    ".git",
  }),
  capabilities = _G.cmp_capabilities,
  on_attach = on_attach,
})
