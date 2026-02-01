local function on_attach(client, bufnr)
  -- Helper for buffer-local keymaps
  local map = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
  end

  -- LSP keymaps
  map("n", "gd", vim.lsp.buf.definition)
  map("n", "gD", vim.lsp.buf.declaration)
  map("n", "gr", vim.lsp.buf.references)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "<leader>rn", vim.lsp.buf.rename)
  map("n", "<leader>ca", vim.lsp.buf.code_action)

  -- Document highlights
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

vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    local diags = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
   	if #diags == 0 then
      vim.api.nvim_echo({}, false, {})
      return
    end 

    local d = diags[1]
    local hl = ({
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN]  = "WarningMsg",
      [vim.diagnostic.severity.INFO]  = "None",
      [vim.diagnostic.severity.HINT]  = "None",
    })[d.severity]

    vim.api.nvim_echo({ { d.message, hl } }, false, {})
  end,
})

local virtual_text_enabled = true

function ToggleVirtualText()
    virtual_text_enabled = not virtual_text_enabled
    vim.diagnostic.config({ virtual_text = virtual_text_enabled })
    if virtual_text_enabled then
        print("Diagnostics virtual_text: ON")
    else
        print("Diagnostics virtual_text: OFF")
    end
end

vim.keymap.set("n", "<leader>tw", ToggleVirtualText, { noremap = true, silent = true })

vim.diagnostic.config({
	virtual_text = true,
	float = true,
	update_in_insert = true,
})

