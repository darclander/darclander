-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig", -- still needed for server configs
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- LSP on_attach function (keymaps, highlights, format)
      local function on_attach(client, bufnr)
        local map = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
        end

        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gD", vim.lsp.buf.declaration)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "gi", vim.lsp.buf.implementation)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>ca", vim.lsp.buf.code_action)
        map("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end)

        if client.supports_method("textDocument/documentHighlight") then
          local hl_group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = bufnr,
            group = hl_group,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = bufnr,
            group = hl_group,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end

      -- vim.lsp.config("clangd", {
      --   cmd = { "/usr/bin/clangd", "--background-index", "--clang-tidy" },
      --   root_dir = vim.fs.find({ ".git", "compile_commands.json" }, { upward = true })[2]
      --                 or vim.loop.cwd(),
      --   capabilities = _G.cmp_capabilities,
      --   on_attach = on_attach,
      -- })

      -- Enable the server
	  require("config.lsp-lang")
    end,
  },
}

