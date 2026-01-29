return {
  default_config = {
    cmd = { "clangd", "--background-index" },
    root_markers = { "compile_commands.json", "compile_flags.txt" },
    filetypes = { "c", "cpp" },
    on_attach = function(client, bufnr)
      -- Enable omnifunc for completion
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end,
  }
}
